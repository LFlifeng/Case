// more/toplist0/toplist0.js
const API = require('../../API/api');
const app = getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    toplist: [],
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    wx.showLoading({
      title: '加载中...'
    });
   this.getTopList();
   console.log(app)
  },
  getTopList(){
    var waitForPlay = [];
    API.getTopList({
      idx: 0,
    }).then(res => {
      res.playlist.trackIds.forEach(function(item){
        waitForPlay.push(item.id);
        app.globalData.waitForPlay = waitForPlay;
      })
      wx.hideLoading();
      if(res.code === 200) {
        this.setData({
          toplist: res.playlist.tracks
        })
      }
    })
   },
   handlePlayAudio(e){
     var audioId = e.currentTarget.dataset.id;
     wx.navigateTo({
       url: `../../play/play?id=${audioId}`,
     })
   }

})