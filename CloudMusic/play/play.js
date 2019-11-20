// play/play.js
const API_BASE_URL = 'http://neteasecloudmusicapi.zhaoboy.com';
const app = getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    innerAudioContext: {},
    song: [],
    songid: [],
    his_songId: [],
    isPlay: '',
    show: true,
    showLyric: true,
  },

  /**
   * 生命周期函数--监听页面加载
   */
  // onLond,第一次进入则获取到index.js传来的歌曲id --> id传给wx.request的URL，获取到歌曲详情 -->
  onLoad: function (options) {
    const audioid = options.id;
    this.play(audioid);
  },
  play(audioid) {
    var _this = this;
    const audioId = audioid;
    //让每一个要播放的歌曲ID给全局变量的songId
    app.globalData.songId = audioId;
    //操作音频播放
    const innerAudioContext = wx.createInnerAudioContext();
    // console.log(innerAudioContext)
    this.setData({
      innerAudioContext,
      isPlay: true,
    });
    // 请求歌曲音频的地址，失败则播放出错，成功则传值给createBgAudio(后台播放管理器，让其后台播放)
    wx.request({
      url: API_BASE_URL + '/song/url',
      data: {
        id: audioId,
      },
      success(res) {
        if (res.data.data[0].url === null) {
          //无法获取音乐资源
          wx.showModal({
            content: '服务器开了小差~~~',
            cancelColor: '#de655c',
            confirmColor: '#de655c',
            showCancel: false,
            confirmText: '返回',
            complete() {
              wx.switchTab({
                url: '/pages/index/index',
              })
            }
          })
        } else {
          // console.log(res.data.data[0])
          _this.createBgAudio(res.data.data[0]);
        }
      },
    });
    //获取歌曲音频的详情
    wx.request({
      url: API_BASE_URL + '/song/detail',
      data: {
        ids: audioId,
      },
      success(res) {
        if (res.data.songs.length === 0) {
          //无法获取音乐资源
          wx.showModal({
            content: '服务器开了小差~~~',
            cancelColor: '#de655c',
            confirmColor: '#de655c',
            showCancel: false,
            confirmText: '返回',
            complete() {
              wx.switchTab({
                url: '/pages/index/index',
              })
            }
          })
        } else {
          _this.setData({
            song: res.data.songs[0]
          });
          // console.log(res.data.songs[0].name)
          app.globalData.songName.push(res.data.songs[0].name);
        }
      },
    });

  },
  //创建歌曲背景播放实例
  createBgAudio(res) {
    //获取全局唯一的背景音频管理器
    const bgAudioManage = wx.getBackgroundAudioManager();
    //将bgAudioManage赋给全局变量
    app.globalData.bgAudioManage = bgAudioManage;
    //将title音频标题给实例
    bgAudioManage.title = 'title';
    bgAudioManage.src = res.url;
    // console.log(bgAudioManage)
    // console.log(res)
    var hisSongId = this.data.his_songId;
    //解构赋值
    var hisSong = {
      id: app.globalData.songId,
      songName: app.globalData.songName
    };
    hisSongId.push(hisSong);
    // console.log(hisSongId)
    //背景音频播放事件
    bgAudioManage.onPlay(res => {
      this.setData({
        hisSongId,
        isPlay: true,
      });
    });
    //背景音频结束事件
    bgAudioManage.onEnded(() => {
      //调用go_lastSong()函数，即歌曲结束自动播放下一首歌
      this.go_lastSong();
    });
    //将hisSongId存入缓存
    wx.setStorageSync('hisSongId', hisSongId);
  },
  // 歌曲结束自动播放下一首
  // go_lastSong() {
  //   var lastSongId = app.globalData.waitForPlaying;
  //   // console.log(lastSongId)//空数组
  //   const songId = lastSongId[Math.floor(Math.random() * lastSongId.length)]; //随机选取lastSongId数组的一个元素
  //   this.data.songid = songId;
  //   this.play(songId);
  //   app.globalData.songId = songId;
  // },
  // 点击切换歌词和封面
  showLyric() {
    const { showLyric } = this.data;
    this.setData({
      showLyric: !showLyric
    })
  },
  // go_index() {
  //   // console.log(1)
  //   // wx.reLaunch({
  //   //   url:'../pages/index/index'
  //   // })
  //   wx.navigateBack({
  //     delta: 1
  //   })
  // },
  //暂停/播放歌曲功能
  handleToggleBGAudio(){
    var bgAudioManage = app.globalData.bgAudioManage;
    // console.log(this.data)
    var {isPlay} = this.data;
    // console.log({isPlay})
    if(isPlay){
      bgAudioManage.pause();//暂停
    }else{
      bgAudioManage.play();//播放
    }
    this.setData({
      isPlay: !isPlay
    });
    // console.log(this.data.isPlay)
  }
})
