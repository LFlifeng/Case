

// 创建过去七天的数组
[...Array(7).keys()].map(days => new Date(Date.now() - 86400000 * days));


// 生成长度为11的随机字母数字字符串
Math.random().toString(36).substring(2);
// hg7znok52x


// 获取URL的查询参数
q={};location.search.replace(/([^?&=]+)=([^&]+)/g,(_,k,v)=>q[k]=v);q;


// 创建本地时间
<body onload="setInterval(()=>document.body.innerHTML=new Date().toLocaleString().slice(10,19))"></body>


// 随机更改数组元素顺序，混淆数组
(arr) => arr.slice().sort(() => Math.random() - 0.5)
/* 
let a = (arr) => arr.slice().sort(() => Math.random() - 0.5)
let b = a([1,2,3,4,5])
console.log(b)
*/


// 生成随机十六进制代码 如：'#c618b2'
'#' + Math.floor(Math.random() * 0xffffff).toString(16).padEnd(6, '0');


// 这是一个臭名昭著的面试题，让你写出他的运行结果，受不了~
for(i=0;++i<101;console.log(i%5?f||i:f+'Buzz'))f=i%3?'':'Fizz'


// 数组去重
[new Set(arr)]


// 用字符串返回一个键盘图形
(_=>[..."`1234567890-=~~QWERTYUIOP[]\\~ASDFGHJKL;'~~ZXCVBNM,./~"].map(x=>(o+=`/${b='_'.repeat(w=x<y?2:' 667699'[x=["BS","TAB","CAPS","ENTER"][p++]||'SHIFT',p])}\\|`,m+=y+(x+'    ').slice(0,w)+y+y,n+=y+b+y+y,l+=' __'+b)[73]&&(k.push(l,m,n,o),l='',m=n=o=y),m=n=o=y='|',p=l=k=[])&&k.join`
`)()
