/*
*AUI素材网是一家提供网页模板下载、手机模板网站下载、微信小程序页面下载、app内嵌页面下载、以企业官网、个人网站、社区论坛、后台网站、个人博客、商城购物网站、专题模板等html源码下载，以及在线交流的平台，致力于打造好用，免费网页模板下载基地；AUI素材网（“北京索引时代网络技术有限公司”），以网页模板源码下载为主。AUI素材网的使命是用web前端技术，让web前端开发更简单，便捷，轻便，快速开发，AUI素材网和大家一起交流web前端技术，打造用户体验一流的网站源码，提供用户下载。我们的使命是用web前端技术，让前端开发更简单，便捷，轻便，快速开发，AUI素材网和大家一起交流前端技术，打造用户体验一流的网站源码，提供用户下载。 本站所有模板均来自团队自制上传，仅用于分享交流，请勿用作商业用途。 请勿侵权，技术支持请联系 aui_cn@163.com ，我们会在第一时间进行回复及处理，如有给您带来不便，敬请谅解。免费模板素材www.588sucai.com www.a-ui.cn 网站设计 PSD 网站前端开发 html5 APP JS JQ Node Vue React 如有需求可联系:18801061167 前端交流群QQ群号:521504936
*  author:lzy-aui
*  slider.js
*  http://azenui.com/
*  http://a-ui.cn/
*  http://www.yidianc.com/
*  http://588sucai.com/
*  https://weibo.com/525135676
*  https://xihazahuopu.taobao.com/
*  合作电话:18519232894
*  QQ:874731831
*  北京索引时代工作室
*/
!function(window) {

    "use strict";

    var doc = window.document
      , ydui = {};

    var util = ydui.util = {

        parseOptions: function(string) {},

        sessionStorage: function() {}(),

        serialize: function(value) {},

        deserialize: function(value) {}
    };

    function storage(ls) {}

    $.fn.emulateTransitionEnd = function(duration) {}
    ;

    if (typeof define === 'function') {
        define(ydui);
    } else {
        window.YDUI = ydui;
    }
    ;function Slider(element, options) {
        this.$element = $(element);
        this.options = $.extend({}, Slider.DEFAULTS, options || {});
        this.init();
    }

    Slider.DEFAULTS = {
        speed: 300,
        autoplay: 5000,

        lazyLoad: false,
        pagination: '.slider-pagination',
        wrapperClass: 'slider-wrapper',
        slideClass: 'slider-item',
        bulletClass: 'slider-pagination-item',
        bulletActiveClass: 'slider-pagination-item-active'
    };

    function Slider(element, options) {
        this.$element = $(element);
        this.options = $.extend({}, Slider.DEFAULTS, options || {});
        this.init();
    }

    Slider.DEFAULTS = {
        speed: 300,
        autoplay: 3000,
        lazyLoad: false,
        pagination: '.slider-pagination',
        wrapperClass: 'slider-wrapper',
        slideClass: 'slider-item',
        bulletClass: 'slider-pagination-item',
        bulletActiveClass: 'slider-pagination-item-active'
    };

    Slider.prototype.init = function() {
        var _this = this
          , options = _this.options
          , $element = _this.$element;

        _this.index = 1;
        _this.autoPlayTimer = null;
        _this.$pagination = $element.find(options.pagination);
        _this.$wrapper = $element.find('.' + options.wrapperClass);
        _this.itemNums = _this.$wrapper.find('.' + options.slideClass).length;

        options.lazyLoad && _this.loadImage(0);

        _this.createBullet();

        _this.cloneItem().bindEvent();
    }
    ;

    Slider.prototype.bindEvent = function() {
        var _this = this
          , touchEvents = _this.touchEvents();

        _this.$wrapper.find('.' + _this.options.slideClass).on(touchEvents.start, function(e) {
            _this.onTouchStart(e);
        }).on(touchEvents.move, function(e) {
            _this.onTouchMove(e);
        }).on(touchEvents.end, function(e) {
            _this.onTouchEnd(e);
        });

        $(window).on('resize.ydui.slider', function() {
            _this.setSlidesSize();
        });

        ~~_this.options.autoplay > 0 && _this.autoPlay();

        _this.$wrapper.on('click.ydui.slider', function(e) {
            if (!_this.touches.allowClick) {
                e.preventDefault();
            }
        });
    }
    ;

    Slider.prototype.cloneItem = function() {
        var _this = this
          , $wrapper = _this.$wrapper
          , $sliderItem = _this.$wrapper.find('.' + _this.options.slideClass)
          , $firstChild = $sliderItem.filter(':first-child').clone()
          , $lastChild = $sliderItem.filter(':last-child').clone();

        $wrapper.prepend($lastChild);
        $wrapper.append($firstChild);

        _this.setSlidesSize();

        return _this;
    }
    ;

    Slider.prototype.createBullet = function() {

        var _this = this;

        if (!_this.$pagination[0])
            return;

        var initActive = '<span class="' + (_this.options.bulletClass + ' ' + _this.options.bulletActiveClass) + '"></span>';

        _this.$pagination.append(initActive + new Array(_this.itemNums).join('<span class="' + _this.options.bulletClass + '"></span>'));
    }
    ;

    Slider.prototype.activeBullet = function() {
        var _this = this;

        if (!_this.$pagination[0])
            return;

        var itemNums = _this.itemNums
          , index = _this.index % itemNums >= itemNums ? 0 : _this.index % itemNums - 1
          , bulletActiveClass = _this.options.bulletActiveClass;

        !!_this.$pagination[0] && _this.$pagination.find('.' + _this.options.bulletClass).removeClass(bulletActiveClass).eq(index).addClass(bulletActiveClass);
    }
    ;

    Slider.prototype.setSlidesSize = function() {
        var _this = this
          , _width = _this.$wrapper.width();

        _this.$wrapper.css('transform', 'translate3d(-' + _width + 'px,0,0)');
        _this.$wrapper.find('.' + _this.options.slideClass).css({
            width: _width
        });
    }
    ;

    Slider.prototype.autoPlay = function() {
        var _this = this;

        _this.autoPlayTimer = setInterval(function() {

            if (_this.index > _this.itemNums) {
                _this.index = 1;
                _this.setTranslate(0, -_this.$wrapper.width());
            }

            _this.setTranslate(_this.options.speed, -(++_this.index * _this.$wrapper.width()));

        }, _this.options.autoplay);
    }
    ;

    Slider.prototype.stopAutoplay = function() {
        var _this = this;
        clearInterval(_this.autoPlayTimer);
        return _this;
    }
    ;

    Slider.prototype.setTranslate = function(speed, x) {
        var _this = this;

        _this.options.lazyLoad && _this.loadImage(_this.index);

        _this.activeBullet();

        _this.$wrapper.css({
            'transitionDuration': speed + 'ms',
            'transform': 'translate3d(' + x + 'px,0,0)'
        });
    }
    ;

    Slider.prototype.touches = {
        moveTag: 0,
        startClientX: 0,
        moveOffset: 0,
        touchStartTime: 0,
        isTouchEvent: false,
        allowClick: false// 用于判断事件为点击还是拖动
    };

    Slider.prototype.onTouchStart = function(event) {
        if (event.originalEvent.touches)
            event = event.originalEvent.touches[0];

        var _this = this
          , touches = _this.touches;

        touches.allowClick = true;

        touches.isTouchEvent = event.type === 'touchstart';

        if (!touches.isTouchEvent && 'which'in event && event.which === 3)
            return;

        if (touches.moveTag == 0) {
            touches.moveTag = 1;

            touches.startClientX = event.clientX;
            touches.touchStartTime = Date.now();

            var itemNums = _this.itemNums;

            if (_this.index == 0) {
                _this.index = itemNums;
                _this.setTranslate(0, -itemNums * _this.$wrapper.width());
                return;
            }

            if (_this.index > itemNums) {
                _this.index = 1;
                _this.setTranslate(0, -_this.$wrapper.width());
            }
        }
    }
    ;

    Slider.prototype.onTouchMove = function(event) {
        event.preventDefault();

        if (event.originalEvent.touches)
            event = event.originalEvent.touches[0];

        var _this = this
          , touches = _this.touches;

        touches.allowClick = false;

        if (touches.isTouchEvent && event.type === 'mousemove')
            return;

        var deltaSlide = touches.moveOffset = event.clientX - touches.startClientX;

        if (deltaSlide != 0 && touches.moveTag != 0) {

            if (touches.moveTag == 1) {
                _this.stopAutoplay();
                touches.moveTag = 2;
            }
            if (touches.moveTag == 2) {
                _this.setTranslate(0, -_this.index * _this.$wrapper.width() + deltaSlide);
            }
        }
    }
    ;

    Slider.prototype.onTouchEnd = function() {
        var _this = this
          , speed = _this.options.speed
          , _width = _this.$wrapper.width()
          , touches = _this.touches
          , moveOffset = touches.moveOffset;

        setTimeout(function() {
            touches.allowClick = true;
        }, 0);

        if (touches.moveTag == 1) {
            touches.moveTag = 0;
        }

        if (touches.moveTag == 2) {
            touches.moveTag = 0;

            var timeDiff = Date.now() - touches.touchStartTime;

            if (timeDiff > 300 && Math.abs(moveOffset) <= _this.$wrapper.width() * .5) {
                _this.setTranslate(speed, -_this.index * _this.$wrapper.width());
            } else {
                _this.setTranslate(speed, -((moveOffset > 0 ? --_this.index : ++_this.index) * _width));
            }
            _this.autoPlay();
        }
    }
    ;

    Slider.prototype.touchEvents = function() {
        var supportTouch = (window.Modernizr && !!window.Modernizr.touch) || (function() {
            return !!(('ontouchstart'in window) || window.DocumentTouch && document instanceof DocumentTouch);
        }
        )();

        return {
            start: supportTouch ? 'touchstart.ydui.slider' : 'mousedown.ydui.slider',
            move: supportTouch ? 'touchmove.ydui.slider' : 'mousemove.ydui.slider',
            end: supportTouch ? 'touchend.ydui.slider' : 'mouseup.ydui.slider'
        };
    }
    ;

    function Plugin(option) {
        return this.each(function() {

            var $this = $(this)
              , slider = $this.data('ydui.slider');

            if (!slider) {
                $this.data('ydui.slider', new Slider(this,option));
            }
        });
    }

    $(window).on('load.ydui.slider', function() {
        $('[data-ydui-slider]').each(function() {
            var $this = $(this);
            $this.slider(window.YDUI.util.parseOptions($this.data('ydui-slider')));
        });
    });

    $.fn.slider = Plugin;

}(window);
