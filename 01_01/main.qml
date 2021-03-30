/********************************************************************
Copyright 2021 DongshuangZhao <imtoby@126.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or
sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR
THE USE OR OTHER DEALINGS IN THE SOFTWARE.
********************************************************************/
import QtQuick 2.12
import QtQuick.Window 2.12

import "./createStatementData.js" as TEST

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    JsonModel {
        id: id_invoice_model
        Component.onCompleted: {
            loadLocalJsonFile("qrc:/json/invoices.json")
        }
        onLoaded: {
            id_load_timer.restart()
        }
    }

    JsonModel {
        id: id_play_model
        Component.onCompleted: {
            loadLocalJsonFile("qrc:/json/plays.json")
        }
        onLoaded: {
            id_load_timer.restart()
        }
    }

    Timer {
        id: id_load_timer
        interval: 300
        onTriggered: {
            id_test_txt.text = TEST.statement(id_invoice_model.jsonObject,
                                              id_play_model.jsonObject)
            console.log(id_test_txt.text)
        }
    }

    Text {
        id: id_test_txt
        anchors.centerIn: parent
    }
}
