// more/more_toplist/more_toplist.js
const API = require('../../API/api');
const app = getApp();

Page({

  /**
   * 页面的初始数据
   */
  data: {
    toplist: []
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    wx.showLoading({
      title: '加载中',
    });
    this.getTopList();
  },
  getTopList() {
    API.getTopList({
      idx: 0,
    }).then(res => {
      wx.hideLoading();
      // console.log(res);
      if (res.code === 200) {
        this.setData({
          toplist: res.playlist
        })
      }
    })
  },
  handleSheet(e){
    var sheetId = e.currentTarget.dataset.id;//获取到event里面的歌曲id赋值给sheetId
    wx.navigateTo({
      url: `./mmore_sheet?id=${sheetId}`,
    })
  }
})