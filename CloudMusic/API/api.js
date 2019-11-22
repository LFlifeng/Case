//封装接口api
const API_BASE_URL = 'http://neteasecloudmusicapi.zhaoboy.com';
var request = (url, data) => {
    var _url = API_BASE_URL + url;
    return new Promise((resolve, reject) => {
        wx.request({
            url: _url,
            method: 'get',
            data: data,
            header: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            success(request) {
                resolve(request.data);
            },
            fail(error) {
                reject(error);
            }
        })
    });
}
module.exports = {
    //个性推荐轮播图
    getBanner(data) {
        return request('/banner', data);
    },
    //最新音乐
    getNewSong(data) {
        return request('/personalized/newsong', data);
    },
    //精选歌单
    getSongSheet(data) {
        return request('/top/playlist', data);
    },
    // 推荐MV
    getRecommendMV(data) {
        return request('/personalized/mv', data);
    },
    //精选电台
    getDjRadios(data) {
        return request('/dj/recommend', data);
    },
    //最新专辑
    getNewEst(data) {
        return request('/album/newest', data);
    },
    // //主播电台轮播图
    // getDJBanner(data){
    //     return request('/dj/banner',data);
    // }
    //所有电台分类推荐
    getRecommendType(data) {
        return request('/dj/recommend/type', data)
    },
    //推荐MV
    getRecommendMV(data) {
        return request('/personalized/mv', data)
    },
    //歌手榜
    getSonger(data) {
        return request('/toplist/artist', data)
    },
    //热门歌单
    getsongsheet(data) {
        return request('/top/playlist', data)
    },
    //榜单排行
    getTopList(data) {
        return request('/top/list', data)
    },
    //热搜接口
    gethotsongs(data){
        return request('/search/hot', data)
    },
    //搜索建议接口
    searchSuggest(data){
        return request('/search/suggest', data)
    },
    //搜索结果接口
    searchResult(data){
        return request('/search', data)
    },
}