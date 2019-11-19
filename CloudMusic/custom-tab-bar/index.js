// index.js
Component({
    data: {
        isShow_index: true,
        isShow_playing: false,
        isShow_me: false,
        selected: 0, //首页
        color: "#8D8D8D",
        selectedColor: "#C62F2F",
        list: [{
            pagePath: "/pages/index/index",
            iconPath: "/images/library_off.png",
            selectedIconPath: "/images/library_on.png",
            text: "乐库"
        }, {
            pagePath: "/pages/love/love",
            iconPath: "/images/collect_off.png",
            selectedIconPath: "/images/collect_on.png",
            text: "收藏"
        },
        {
            pagePath: "/pages/me/me",
            iconPath: "/images/me_off.png",
            selectedIconPath: "/images/me_on.png",
            text: "我的"
        }]
    },

    methods: {
        switchTab_index: function () {
            wx.switchTab({
                url: '/pages/index/index'
            })
            this.setData({
                isShow_index: true,
                isShow_me: false,
                isShow_playing: false
            })
        },

        switchTab_playing: function () {
            wx.switchTab({
                url: '/pages/love/love'
            })
            this.setData({
                isShow_playing: true,
                isShow_index: false,
                isShow_me: false
            })
        },

        switchTab_me: function () {
            wx.switchTab({
                url: '/pages/me/me'
            })
            this.setData({
                isShow_me: true,
                isShow_playing: false,
                isShow_index: false
            })
        }
    }
})