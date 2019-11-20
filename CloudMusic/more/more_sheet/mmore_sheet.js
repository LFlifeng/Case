// more/more_sheet/mmore_sheet.js
const API_BASE_URL = 'http://neteasecloudmusicapi.zhaoboy.com';
const app = getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    songList: [],
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var _this = this;
    const sheetId = options.id;
    wx.request({
      url: API_BASE_URL + '/toplist/detail',
      data: {
        id: sheetId,
      },
      method: 'GET', 
      success(res){
        // success
        // console.log(res)
        if(res.data.code === 200) {
          _this.setData({
            songList: res.data.list,
          })
        }
      },
    });

  },
  handlePlayAudio(e){
    var audioId = e.currentTarget.dataset.id;
    wx.navigateTo({
      url: `../../play/play?id=${audioId}`,
    })
  }

 
})