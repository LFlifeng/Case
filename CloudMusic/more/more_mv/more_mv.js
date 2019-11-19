const API = require('../../API/api');
const app = getApp();

Page({
    data: {
        mv: []
    },
    onLoad(options) {
        wx.showLoading({
            title: '加载中',
        });
        this.getRecommendMV();
    },
    getRecommendMV() {
        API.getRecommendMV({}).then(res => {
            wx.hideLoading();
            if(res.code === 200){
                this.setData({
                    mv: res.result
                })
            }
        })
    },
    handlePlayMv(e){
        const mvId = e.currentTarget.dataset.id;
        wx.navigateTo({
            url: `../../play/play_mv?id=${mvId}`,
        })
    }
})