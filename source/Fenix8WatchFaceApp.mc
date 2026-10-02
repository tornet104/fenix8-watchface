using Toybox.Application as App;
using Toybox.Graphics as Gfx;
using Toybox.Lang as Lang;
using Toybox.System as Sys;
using Toybox.WatchUi as Ui;

class Fenix8WatchFaceApp extends App.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    function getInitialView() {
        return [ new Fenix8WatchFaceView() ];
    }
}

class Fenix8WatchFaceView extends Ui.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    function onUpdate(dc) {
        var clockTime = Sys.getClockTime();

        var timeString = Lang.format(
            "$1$:$2$",
            [
                clockTime.hour.format("%02d"),
                clockTime.min.format("%02d")
            ]
        );

        dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
        dc.clear();

        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);

        dc.drawText(
            dc.getWidth() / 2,
            dc.getHeight() / 2,
            Gfx.FONT_LARGE,
            timeString,
            Gfx.TEXT_JUSTIFY_CENTER | Gfx.TEXT_JUSTIFY_VCENTER
        );
    }
}
