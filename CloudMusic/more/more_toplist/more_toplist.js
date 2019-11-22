// more/more_toplist/more_toplist.js
const API = require('../../API/api');
const app = getApp();

Page({

  /**
   * 页面的初始数据
   */
  data: {
    toplist0: [],
    toplist1: [],
    toplist2: [],
    toplist3: [],
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
          toplist0: res.playlist
        })
      }
    });
    API.getTopList({
      idx: 1,
    }).then(res => {
      wx.hideLoading();
      if (res.code === 200) {
        this.setData({
          toplist1: res.playlist
        })
      }
    });
    API.getTopList({
      idx: 2,
    }).then(res => {
      wx.hideLoading();
      if (res.code === 200) {
        this.setData({
          toplist2: res.playlist
        })
      }
    });
    API.getTopList({
      idx: 3,
    }).then(res => {
      wx.hideLoading();
      if (res.code === 200) {
        this.setData({
          toplist3: res.playlist
        })
      }
    });
  },
  go_toplist0(){
    wx.navigateTo({
      url: `../toplist0/toplist0`,
    });
  },
  go_toplist1(){
    wx.navigateTo({
      url: `../toplist1/toplist1`,
    });
  },
  go_toplist2(){
    wx.navigateTo({
      url: `../toplist2/toplist2`,
    });
  },
  go_toplist3(){
    wx.navigateTo({
      url: `../toplist3/toplist3`,
    });
  },
})