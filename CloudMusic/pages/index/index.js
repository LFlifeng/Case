const API = require('../../API/api');
const app = getApp();
const change = require('../../utils/util');
let half;
let quarter;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    slideOffset: 0,
    //歌单
    songsheet_index: [],
    songsheet: [],
    //推荐MV
    recommend_MV: [],
    //音乐
    newSong_index: [],
    newSong: [],
    //电台
    djRadios_index: [],
    djRadios: [],
    //最新专辑
    newEst: [],
    //个性推荐轮播图
    banner: [],
    //创作翻唱
    chuangzuo: [],
    // 情感调频
    qinggan: [],
    //音乐故事
    yygushi: [],
    // 明星做主播
    starAszhubo: [],
    //娱乐影视
    ylys: [],
    // 脱口秀
    tkx: [],
    // 美文读物
    mwdw: [],
    // 广播剧
    gbj: [],
    // 相声曲艺
    xsqy: [],
    //人文历史
    rwls: [],
    //路途城市
    ltcs: [],
    // 外语世界
    wysj: [],
    // 亲子宝贝
    qzbb: [],
    // 3D电子
    sddz: [],
    //有声书
    yss: [],
    //二次元
    ecy: [],
    //校园教育
    xyjy: [],
    // 知识技能
    zsjn: [],
    //商业财经
    sycj: [],
    //科技科学
    kjkx: [],
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad() {
    wx.showLoading({
      title: '加载中',
    });
    var _this = this;
    //首页总tab切换的下划线
    wx.getSystemInfo({
      success: function (res) {
        half = res.windowWidth / 2;
        quarter = res.windowWidth / 2 / 2;
        _this.setData({
          slideOffset: quarter - 14
        })
      }
    });
    //个性推荐轮播图
    this.getBanner();
    //推荐MV
    this.getRecommendMV();
    //精选歌单
    this.getSongSheet();
    //最新音乐
    this.getNewSong();
    //精选电台
    this.getDjRadios();
    //最新专辑
    this.getNewEst();
    // //电台Banner
    // this.getDJBanner();
    //电台分类
    this.getRecommendType();
  },
  // swiper的滑动
  // 第二种方法是直接把slideOffset赋死值，但不兼容
  // 第三种是选择器 class="{{Changeline?'swiper_header_line_before':'swiper_header_line_after'}}" if current为1则什么什么，if 为2 ，则什么什么。
  changeline(e) {
    // console.log(e)
    // console.log(e.detail.current)
    let current = e.detail.current; //获取swiper的current值
    if (e.detail.current === 0) {
      this.setData({
        slideOffset: quarter - 14
      })
    }
    if (e.detail.current === 1) {
      this.setData({
        slideOffset: (quarter - 14) + half
      })
    }
    if (e.detail.current === null) {
      this.setData({
        slideOffset: quarter - 14
      })
    }
  },
  //个性推荐轮播图
  getBanner() {
    API.getBanner({ type: 2 }).then(res => {
      wx.hideLoading();
      if (res.code === 200) {
        this.setData({
          banner: res.banners
        })
      }
    })
  },
  //最新音乐
  getNewSong() {
    API.getNewSong({}).then(res => {
      if (res.code === 200) {
        this.setData({
          newSong_index: res.result.slice(0, 6),
          newSong: res.result
        })
      }
    })
  },
  //精选歌单
  getSongSheet() {
    API.getSongSheet({}).then(res => {
      if (res.code === 200) {
        this.setData({
          songsheet_index: res.playlists.slice(0, 6),
          songsheet: res.playlists
        })
      }
    })
  },
  // 推荐MV
  getRecommendMV() {
    API.getRecommendMV({}).then(res => {
      if (res.code === 200) {
        this.setData({
          recommend_MV: res.result.slice(0, 4)
        })
      }
    })
  },
  //精选电台
  getDjRadios() {
    API.getDjRadios({}).then(res => {
      if (res.code === 200) {
        this.setData({
          djRadios_index: res.djRadios.slice(0, 6),
          djRadios: res.djRadios
        })
      }
    })
  },
  // 最新专辑
  getNewEst() {
    API.getNewEst({}).then(res => {
      if (res.code === 200) {
        this.setData({
          newEst: res.albums.slice(0, 6)
        })
      }
    })
  },
  // //电台Banner
  // getDJBanner(){
  //   API.getDJBanner({}).then(res => {
  //     console.log(res)
  //   })
  // }
  //电台分类
  getRecommendType() {
    //创作翻唱
    API.getRecommendType({
      type: 2001
    }).then(res => {
      if (res.code === 200) {
        this.setData({
          chuangzuo: res.djRadios.slice(0, 3)
        })
      }
    });
    //情感调频
    API.getRecommendType({
      type: 3
    }).then(res => {
      if (res.code === 200) {
        this.setData({
          qinggan: res.djRadios.slice(0, 3)
        })
      }
    });
    //音乐故事
    API.getRecommendType({
      type: 2
    }).then(res => {
      if (res.code === 200) {
        this.setData({
          yygushi: res.djRadios.slice(0, 3)
        })
      }
    });
    //明星做主播
    API.getRecommendType({
      type: 1
    }).then(res => {
      if (res.code === 200) {
        this.setData({
          starAszhubo: res.djRadios.slice(0, 3)
        })
      }
    });
    //娱乐影视
    API.getRecommendType({
      type: 4
    }).then(res => {
      if (res.code === 200) {
        this.setData({
          ylys: res.djRadios.slice(0, 3)
        })
      }
    });
    //脱口秀
    API.getRecommendType({
      type: 5
    }).then(res => {
      if (res.code === 200) {
        this.setData({
          tkx: res.djRadios.slice(0, 3)
        })
      }
    });
    //美文读物
    API.getRecommendType({
      type: 6
    }).then(res => {
      if (res.code === 200) {
        this.setData({
          mwdw: res.djRadios.slice(0, 3)
        })
      }
    });
    //广播剧
    API.getRecommendType({
      type: 7
    }).then(res => {
      if (res.code === 200) {
        this.setData({
          gbj: res.djRadios.slice(0, 3)
        })
      }
    });
    //相声曲艺
    API.getRecommendType({
      type: 8
    }).then(res => {
      if (res.code === 200) {
        this.setData({
          xsqy: res.djRadios.slice(0, 3)
        })
      }
    });
    //人文历史
    API.getRecommendType({
      type: 11
    }).then(res => {
      if (res.code === 200) {
        this.setData({
          rwls: res.djRadios.slice(0, 3)
        })
      }
    });
    //路途城市
    API.getRecommendType({
      type: 12
    }).then(res => {
      if (res.code === 200) {
        this.setData({
          ltcs: res.djRadios.slice(0, 3)
        })
      }
    });
    //外语世界
    API.getRecommendType({
      type: 13
    }).then(res => {
      if (res.code === 200) {
        this.setData({
          wysj: res.djRadios.slice(0, 3)
        })
      }
    });
    //亲子宝贝
    API.getRecommendType({
      type: 14
    }).then(res => {
      if (res.code === 200) {
        this.setData({
          qzbb: res.djRadios.slice(0, 3)
        })
      }
    });
    //3D电子
    API.getRecommendType({
      type: 10002
    }).then(res => {
      if (res.code === 200) {
        this.setData({
          sddz: res.djRadios.slice(0, 3)
        })
      }
    });
    //有声书
    API.getRecommendType({
      type: 10001
    }).then(res => {
      if (res.code === 200) {
        this.setData({
          yss: res.djRadios.slice(0, 3)
        })
      }
    });
    //二次元
    API.getRecommendType({
      type: 3001
    }).then(res => {
      if (res.code === 200) {
        this.setData({
          ecy: res.djRadios.slice(0, 3)
        })
      }
    });
    //校园教育
    API.getRecommendType({
      type: 4001
    }).then(res => {
      if (res.code === 200) {
        this.setData({
          xyjy: res.djRadios.slice(0, 3)
        })
      }
    });
    //知识技能
    API.getRecommendType({
      type: 453050
    }).then(res => {
      if (res.code === 200) {
        this.setData({
          zsjn: res.djRadios.slice(0, 3)
        })
      }
    });
    //商业财经
    API.getRecommendType({
      type: 453051
    }).then(res => {
      if (res.code === 200) {
        this.setData({
          sycj: res.djRadios.slice(0, 3)
        })
      }
    });
    //科技科学
    API.getRecommendType({
      type: 453052
    }).then(res => {
      if (res.code === 200) {
        this.setData({
          kjkx: res.djRadios.slice(0, 3)
        })
      }
    });
  },
  //点击跳转页面
  go_MV() {
    wx.navigateTo({
      url: '../../more/more_mv/more_mv',
    })
  },
  go_songer() {
    wx.navigateTo({
      url: '../../more/more_songer/more_songer',
    })
  },
  go_songsheet() {
    wx.navigateTo({
      url: '../../more/more_sheet/more_sheet',
    })
  },
  go_toplist() {
    wx.navigateTo({
      url: '../../more/more_toplist/more_toplist',
    })
  },
})