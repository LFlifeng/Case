const API_BASE_URL = 'http://neteasecloudmusicapi.zhaoboy.com';
const app = getApp();
Page({
    data: {
        mv: [],
        autoplay: true,
        loop: true,
        showfullscreenbtn: true,
        showcenterplaybtn: true,
        enableprogressgesture: true,
        showmutebtn: true,
        objectfit: 'contain',
    },
    onLoad(options) {
        const mvid = options.id;
        var _this = this;
        wx.request({
            url: API_BASE_URL + "/mv/detail",
            data: {
                mvid: mvid
            },
            success(res) {
                if (res.data.data.brs === null) {
                    wx.showModal({
                        content: '服务器开了点小差~~',
                        cancelColor: '#DE655C',
                        confirmColor: '#DE655C',
                        showCancel: false,
                        confirmText: '返回',
                        complete() {
                            wx.switchTab({
                                url: '/pages/index/index'
                            })
                        }
                    })
                } else {
                    _this.setData({
                        mv: res.data.data
                    })
                }
            }
        })
    },
    timeUpdate(e) {
        // console.log(e)
        var _time = e.detail.duration - e.detail.currentTime;
        // console.log(_time)
    }
})