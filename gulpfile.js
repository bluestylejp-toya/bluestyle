var gulp = require("gulp");

// [gulp-*]モジュールを一括ロード
var $ = require("gulp-load-plugins")();

// それ以外のモジュール
var bs = require("browser-sync").create();
var fs = require("fs");
var del = require("del");
var minimist = require("minimist");
var runSequence = require("run-sequence");
var imageminPngquant = require("imagemin-pngquant");
var imageminJpegRecompress = require("imagemin-jpeg-recompress");

//ejs
var ejs = require("gulp-ejs");
var rename = require("gulp-rename");
var plumber = require("gulp-plumber");
var htmlbeautify = require("gulp-html-beautify");

const { task } = require("gulp");

//開発モード、本番環境モード切替
var options = minimist(process.argv.slice(2), envSettings);
var envSettings = {
  string: "env",
  default: {
    env: process.env.NODE_ENV || "development", // NODE_ENVに指定が無い場合のデフォルト
  },
};
var isProduction = options.env === "production" ? true : false;
console.log("[is production]", isProduction);

// コンパイル設定
var bsOpenBrowser = false; //BS初期化時にブラウザを自動で開くかどうか
var scss = require("gulp-sass")(require("sass"));

// 共通パス設定
var paths = {
  srcDir: "src/",
  rootDir: "data/Smarty/templates/default/",
};

// 関連ファイルパス設定
var src = {
  scss: paths.srcDir + "scss/**/*.scss",
  lpScss: paths.srcDir + "lp/scss/**/*.scss",
  js: paths.srcDir + "lp/js/**/*.js",
  ejs: paths.srcDir + "ejs/**/*.ejs",
  img: paths.srcDir + "img/**/**/*.+(jpg|png|gif|svg|ico)",
};

var dest = {
  html: "html/lp/",
  js: "html/lp/assets/js",
  css: "html/user_data/packages/default/css",
  lpCss: "html/lp/assets/css",
  img: "html/lp/assets/img",
};

// ベンダープレフィックス付与範囲
var prefixBrowsers = [
  "ie >= 9",
  "ff >= 30",
  "chrome >= 34",
  "safari >= 7",
  "opera >= 23",
  "ios >= 9",
  "android >= 4.4",
  "bb >= 10",
];

var templateFiles = [paths.rootDir + "*.tpl", paths.rootDir + "**/*.tpl"];

// browserSync初期化
gulp.task("bs-init", function () {
  bs.init({
    proxy: "http://localhost:8080",
    open: "external",
    reloadDelay: 1000,
    open: bsOpenBrowser,
  });
});

// browserSyncリロード
gulp.task("bs-reload", function () {
  bs.reload();
});

// SASS -> CSS
var sassOption = isProduction ? { outputStyle: "compressed" } : {};
gulp.task("sass", function (done) {
  gulp
    .src(src.scss)
    // .pipe($.cached("sass"))
    .pipe($.sassPartialsImported(paths.srcDir + "scss/"))
    .pipe($.if(!isProduction, $.sourcemaps.init()))
    .pipe(scss({ outputStyle: "compressed" }))
    .on("error", errNotify())
    .pipe(
      $.autoprefixer({
        autoprefixer: { browsers: prefixBrowsers },
      })
    )
    .pipe($.if(!isProduction, $.sourcemaps.write("./_map")))
    .pipe(gulp.dest(dest.css))
    .pipe(bs.stream())
    // .pipe($.notify({ message: "SASS -> CSS Completed", onLast: true }));
  done();
});
gulp.task("lpSass", function (done) {
  gulp
    .src(src.lpScss)
    // .pipe($.cached("sass"))
    .pipe($.sassPartialsImported(paths.srcDir + "lp/scss/"))
    .pipe($.if(!isProduction, $.sourcemaps.init()))
    .pipe(scss({ outputStyle: "compressed" }))
    .on("error", errNotify())
    .pipe(
      $.autoprefixer({
        autoprefixer: { browsers: prefixBrowsers },
      })
    )
    .pipe($.if(!isProduction, $.sourcemaps.write("./_map")))
    .pipe(gulp.dest(dest.lpCss))
    .pipe(bs.stream())
    // .pipe($.notify({ message: "SASS -> CSS Completed", onLast: true }));
  done();
});

// JS結合＆圧縮
gulp.task("jsmin", function (done) {
  // 共通JSファイル (ベンダー系含む)
  gulp
    .src(paths.srcDir + "js/**/*.js")
    .pipe($.order(["jquery-*.js", "*.js"])) //jqueryを先頭に
    .pipe($.if(!isProduction, $.sourcemaps.init()))
    .pipe($.concat("main.min.js"))
    .pipe($.if(isProduction, $.uglify()))
    .pipe($.if(!isProduction, $.sourcemaps.write("./_map")))
    .pipe(gulp.dest(dest.js));
  done();
});

// ファイルの監視
gulp.task("watch", function () {
  gulp.watch(src.scss, gulp.task("sass"));
  gulp.watch(src.lpScss, gulp.task("lpSass"));
  gulp.watch(src.img, gulp.task("imgmin"));
  gulp.watch(src.js, gulp.task("jsmin"));
  gulp.watch(src.ejs, gulp.task("ejs"));
  gulp.watch(templateFiles, gulp.task("bs-reload"));
});

// エラー通知
function errNotify() {
  return $.notify.onError({
    message: "Error: <%= error.message %>",
    title: "Error running something",
    sound: "Glass",
  });
}

//画像圧縮
gulp.task("imgmin", function (done) {
  return gulp
    .src(src.img)
    .pipe($.cached("image"))
    .pipe(
      $.imagemin([
        $.imagemin.gifsicle({ interlaced: true }),
        imageminPngquant(),
        imageminJpegRecompress(),
        $.imagemin.svgo({
          plugins: [{ removeViewBox: true }],
        }),
      ])
    )
    .pipe(gulp.dest(dest.img))
    .pipe(bs.stream({ once: true }))
    // .pipe($.notify({ message: "Images minified", onLast: true }));
  done();
});

// ejs
gulp.task("ejs", function (done) {
  const json_path = "./src/data.json";
  const json = JSON.parse(fs.readFileSync(json_path));

  return gulp
    .src(["src/ejs/**/*.ejs", "!" + "src/ejs/**/_*.ejs"])
    .pipe(plumber())
    .pipe(
      ejs({
        jsonData: json,
      })
    )
    .pipe(
      htmlbeautify({
        indent_size: 2,
        indent_char: " ",
        max_preserve_newlines: 0,
        preserve_newlines: false,
        indent_inner_html: false,
        extra_liners: [],
      })
    )
    .pipe(rename({ extname: ".html" }))
    .pipe(gulp.dest("./html/lp"))
    .pipe(bs.stream())
    // .pipe($.notify({ message: "HTML compiled", onLast: true }));
  done();
});

// task
gulp.task(
  "default",
  gulp.series(
    gulp.parallel("sass", "lpSass", "imgmin", "ejs"),
    gulp.parallel("watch", "bs-init")
  )
);
