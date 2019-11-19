const API = require('../../API/api');
const app = getApp();
Page({
    data: {
        songers: []
    },
    onLoad(options) {
        wx.showLoading({
            title: '加载中',
        });
        this.getSonger()
    },
    getSonger() {
        API.getSonger({}).then(res => {
            wx.hideLoading();
            this.setData({
                songers: res.list.artists
            })
        })
    },
    handleSheet(e){
        var songId = e.currentTarget.dataset.id;
        wx.navigateTo({
            url: `./mmore_songer?id=${songId}`,
        })
    }

})