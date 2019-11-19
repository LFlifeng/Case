// more/more_songer/mmore_songer.js
const API_BASE_URL = 'http://neteasecloudmusicapi.zhaoboy.com';
const app = getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    songList: []
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
    wx.showLoading({
      title: '加载中',
    });
    const songId = options.id;
    var _this = this;
    wx.request({
      url: API_BASE_URL + '/artists',
      data: {
        id: songId
      },
      success(res){
        var hotSongs = res.data.hotSongs;
        var hotSongsId = [];
        hotSongs.forEach(function(item){
          hotSongsId.push(item.id);
          app.globalData.hotSongsId = hotSongsId;  //让hotSongsId数组给全局数组
        });
        wx.hideLoading();
        _this.setData({
          songList: hotSongs
        });
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