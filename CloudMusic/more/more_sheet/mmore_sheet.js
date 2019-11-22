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
      url: API_BASE_URL + '/playlist/detail',
      data: {
        id: sheetId,
      },
      method: 'GET', 
      success(res){
        const waitForPlay = new Array;
        for (let i = 0; i <= res.data.playlist.trackIds.length - 1;i++){ //循环打印出其id
          waitForPlay.push(res.data.playlist.trackIds[i].id) //循环push ID 到waitForPlay数组
          app.globalData.waitForPlaying = waitForPlay  //让waitForPlay数组给全局数组
          // console.log(app.globalData.waitForPlaying)
        }
        if(res.data.code === 200) {
          _this.setData({
            songList: res.data.playlist.tracks,
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