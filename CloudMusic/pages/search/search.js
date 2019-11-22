// pages/search/search.js
const API = require('../../API/api');
Page({

  /**
   * 页面的初始数据
   */
  data: {
    hotSongs: [],//热搜歌曲
    inputValue: null,//输入框输入的值
    history: [], //搜索历史存放数组
    searchsuggest: [], //搜索建议
    showView: true,//组件的显示与隐藏
    showsongresult: true,
    searchresult: [],//搜索结果
    searchKey: []
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
    wx.showLoading({
      title: '加载中',
    });
    this.getHotSongs();
  },
  //热搜歌曲
  getHotSongs() {
    API.gethotsongs({
      type: 'new'
    }).then(res => {
      wx.hideLoading();
      // console.log(res)
      if (res.code === 200) {
        this.setData({
          hotSongs: res.result.hots
        })
      }
    })
  },
  

})