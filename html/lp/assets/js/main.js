"use strict";
window.addEventListener("DOMContentLoaded", () => {
  /*!
   * MoveTo - A lightweight scroll animation javascript library without any dependency.
   * Version 1.8.3 (21-07-2019 00:32)
   * Licensed under MIT
   * Copyright 2019 Hasan Aydoğdu <hsnaydd@gmail.com>
   */

  var MoveTo = (function () {
    var e = {
      tolerance: 0,
      duration: 800,
      easing: "easeOutQuart",
      container: window,
      callback: function () {},
    };
    function o(t, n, e, o) {
      return (t /= o), -e * (--t * t * t * t - 1) + n;
    }
    function v(n, e) {
      var o = {};
      return (
        Object.keys(n).forEach(function (t) {
          o[t] = n[t];
        }),
        Object.keys(e).forEach(function (t) {
          o[t] = e[t];
        }),
        o
      );
    }
    function d(t) {
      return t instanceof HTMLElement ? t.scrollTop : t.pageYOffset;
    }
    function t() {
      var t =
          0 < arguments.length && void 0 !== arguments[0] ? arguments[0] : {},
        n = 1 < arguments.length && void 0 !== arguments[1] ? arguments[1] : {};
      (this.options = v(e, t)),
        (this.easeFunctions = v({ easeOutQuart: o }, n));
    }
    return (
      (t.prototype.registerTrigger = function (t, n) {
        var e = this;
        if (t) {
          var o = t.getAttribute("href") || t.getAttribute("data-target"),
            r =
              o && "#" !== o
                ? document.getElementById(o.substring(1))
                : document.body,
            i = v(
              this.options,
              (function (e, t) {
                var o = {};
                return (
                  Object.keys(t).forEach(function (t) {
                    var n = e.getAttribute(
                      "data-mt-".concat(
                        (function (t) {
                          return t.replace(/([A-Z])/g, function (t) {
                            return "-" + t.toLowerCase();
                          });
                        })(t)
                      )
                    );
                    n && (o[t] = isNaN(n) ? n : parseInt(n, 10));
                  }),
                  o
                );
              })(t, this.options)
            );
          "function" == typeof n && (i.callback = n);
          var a = function (t) {
            t.preventDefault(), e.move(r, i);
          };
          return (
            t.addEventListener("click", a, !1),
            function () {
              return t.removeEventListener("click", a, !1);
            }
          );
        }
      }),
      (t.prototype.move = function (i) {
        var a = this,
          c =
            1 < arguments.length && void 0 !== arguments[1] ? arguments[1] : {};
        if (0 === i || i) {
          c = v(this.options, c);
          var u,
            s = "number" == typeof i ? i : i.getBoundingClientRect().top,
            f = d(c.container),
            l = null;
          s -= c.tolerance;
          window.requestAnimationFrame(function t(n) {
            var e = d(a.options.container);
            l || (l = n - 1);
            var o = n - l;
            if (u && ((0 < s && e < u) || (s < 0 && u < e)))
              return c.callback(i);
            u = e;
            var r = a.easeFunctions[c.easing](o, f, s, c.duration);
            c.container.scroll(0, r),
              o < c.duration
                ? window.requestAnimationFrame(t)
                : (c.container.scroll(0, s + f), c.callback(i));
          });
        }
      }),
      (t.prototype.addEaseFunction = function (t, n) {
        this.easeFunctions[t] = n;
      }),
      t
    );
  })();
  "undefined" != typeof module
    ? (module.exports = MoveTo)
    : (window.MoveTo = MoveTo);

  let menuBtn = document.querySelector(".js-menu-btn");
  let body = document.querySelector("body");
  let bg = document.querySelector(".js-menu-close-btn");
  menuBtn.addEventListener("click", () => {
    menuBtn.classList.toggle("on");
    body.classList.toggle("hidden");
    bg.addEventListener("click", () => {
      menuBtn.classList.remove("on");
      body.classList.remove("hidden");
    });
  });
  const moveto = new MoveTo();
  let anchorTags = document.querySelectorAll('a[href^="#"]');
  anchorTags = Array.prototype.slice.call(anchorTags, 0); //IE対策
  anchorTags.forEach((anchor) => {
    moveto.registerTrigger(anchor);
    anchor.addEventListener("click", () => {
      menuBtn.classList.remove("on");
      body.classList.remove("hidden");
    });
  });
  const setFillHeight = () => {
    const vh = window.innerHeight * 0.01;
    document.documentElement.style.setProperty("--vh", `${vh}px`);
    console.log(vh);
  };

  let vw = window.innerWidth;

  window.addEventListener("resize", () => {
    if (vw === window.innerWidth) {
      // 画面の横幅にサイズ変動がないので処理を終える
      return;
    }

    // 画面の横幅のサイズ変動があった時のみ高さを再計算する
    vw = window.innerWidth;
    setFillHeight();
  });

  // 初期化
  setFillHeight();
});
