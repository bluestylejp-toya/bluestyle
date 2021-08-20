var gulp = require("gulp");

// [gulp-*]モジュールを一括ロード
var $ = require("gulp-load-plugins")();

// それ以外のモジュール
var bs = require("browser-sync").create();
var fs = require("fs");
var del = require("del");
var minimist = require("minimist");
var runSequence = require("run-sequence");

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
console.log("[build env]", options.env, "[is production]", isProduction);

// コンパイル設定
var bsOpenBrowser = false; //BS初期化時にブラウザを自動で開くかどうか
var sass = require("gulp-sass")(require("sass"));

// 共通パス設定
var paths = {
  srcDir: "src/",
  rootDir: "data/Smarty/templates/",
  cmnDir: "public/assets/",
};

// 関連ファイルパス設定
var src = {
  scss: paths.srcDir + "scss/**/*.scss",
  js: paths.srcDir + "js/**/*.js",
  ejs: paths.srcDir + "ejs/**/*.ejs",
  img: paths.srcDir + "images/**/*.+(jpg|png|gif|svg|ico)",
  icon: paths.srcDir + "icon/**/*.svg",
};

var dest = {
  js: "html/user_data/packages/default/js",
  css: "html/user_data/packages/default/css",
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

//WPを使う場合のパス設定
var files = [paths.rootDir + "*.tpl", paths.rootDir + "**/*.tpl"];

// browserSync初期化
gulp.task("bs-init", function () {
  bs.init({
    proxy: "http://localhost:8080",
    open: "external",
    reloadDelay: 1000,
  });
});

// browserSync php初期設定
gulp.task("bs-init-usephp", function () {
  bs.init({
    proxy: "localhost:3306", //127.0.0.1:8000
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
  return gulp
    .src(src.scss)
    .pipe($.cached("sass"))
    .pipe($.sassPartialsImported(paths.srcDir + "scss/"))
    .pipe($.if(!isProduction, $.sourcemaps.init()))
    .pipe(sass({ outputStyle: "compressed" }))
    .on("error", errNotify())
    .pipe(
      $.autoprefixer({
        autoprefixer: { browsers: prefixBrowsers },
      })
    )
    .pipe($.if(!isProduction, $.sourcemaps.write("./_map")))
    .pipe(gulp.dest(dest.css))
    .pipe(bs.stream())
    .pipe($.notify({ message: "SASS -> CSS Completed", onLast: true }));
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
  gulp.watch(files, gulp.task("bs-reload"));

  gulp.watch(src.scss, gulp.task("sass"));
  gulp.watch(src.js, gulp.task("jsmin"));
});

// エラー通知
function errNotify() {
  return $.notify.onError({
    message: "Error: <%= error.message %>",
    title: "Error running something",
    sound: "Glass",
  });
}

// task
gulp.task(
  "default",
  gulp.series(gulp.parallel("sass", "jsmin"), gulp.parallel("watch", "bs-init"))
);
