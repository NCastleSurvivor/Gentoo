import{u as C,g as k,_ as b}from"./index-429ff8e5.js";import{M as I}from"./MessageEmpty-30652268.js";/* empty css                   */import{M as w}from"./MessageCommonItem-aeae813a.js";import{d as x,f as u,g as N,C as s,D as t,u as m,N as _,I as E,W as d,H as B,Z as S,_ as V,af as D,Y as L,O as $,P as F,M as a,a7 as H,aw as O}from"./element-plus-dc5e6ec0.js";import"./index-9b3e9b96.js";const P="/assets/MessageCommon-3f3b2216.svg",g=n=>($("data-v-b171dca1"),n=n(),F(),n),R={class:"messagecommon-wrap"},T={class:"head"},W=["src"],Y=g(()=>t("span",null,"互动消息",-1)),Z={key:0,"element-loading-background":"rgba(255, 255, 255, 0.7)",class:"loading"},j={key:1,class:"message-list"},q={key:2,class:"empty"},z=["src"],A=g(()=>t("span",null,"暂无数据",-1)),G=x({__name:"MessageCommon",setup(n){const v=C(),l=u(7),o=u(!1),e=u([]),p=()=>{l.value<e.value.length&&(l.value+=5)},f=c=>{e.value=e.value.filter(i=>i.message_id!==c)};return N(async()=>{o.value=!0;const c=await k({type:1});e.value=c.result.reverse(),o.value=!1}),(c,i)=>{const h=D,M=L,y=O;return a(),s("div",R,[t("div",T,[t("div",null,[t("img",{src:m(P)},null,8,W),Y]),_(h,{onClick:i[0]||(i[0]=r=>m(v).push({name:"home"})),style:{"margin-right":"30px"}},{default:E(()=>[H("返回")]),_:1})]),o.value?d((a(),s("div",Z,null,512)),[[M,o.value]]):B("",!0),e.value.length>0||o.value?(a(),s("div",j,[d((a(),s("ul",null,[(a(!0),s(S,null,V(l.value>e.value.length?e.value.length:l.value,r=>(a(),s("li",{key:r},[_(w,{message:e.value[r-1],onDeleteMessage:f},null,8,["message"])]))),128))])),[[y,p]])])):(a(),s("div",q,[t("img",{src:m(I),alt:"MessageEmpty"},null,8,z),A]))])}}});const se=b(G,[["__scopeId","data-v-b171dca1"]]);export{se as default};