import{u as k,g as I,_ as w}from"./index-429ff8e5.js";import{M as x}from"./MessageEmpty-30652268.js";/* empty css                   */import{M as C}from"./MessageCommonItem-aeae813a.js";import{d as N,f as u,g as b,C as s,D as t,u as _,N as d,I as E,W as g,H as U,Z as B,_ as S,af as V,Y as D,O as H,P as L,M as a,a7 as F,aw as O}from"./element-plus-dc5e6ec0.js";import"./index-9b3e9b96.js";const P="/assets/MessageUsersHead-bb08ed06.svg",m=l=>(H("data-v-e609c1c4"),l=l(),L(),l),R={class:"messageusers-wrap"},T={class:"head"},W=["src"],Y=m(()=>t("span",null,"关注动态",-1)),Z={key:0,"element-loading-background":"rgba(255, 255, 255, 0.7)",class:"loading"},$={key:1,class:"message-list"},j={key:2,class:"empty"},q=["src"],z=m(()=>t("span",null,"暂无数据",-1)),A=N({__name:"MessageUsers",setup(l){const v=k(),n=u(7),o=u(!1),e=u([]),p=()=>{n.value<e.value.length&&(n.value+=5)},h=c=>{e.value=e.value.filter(r=>r.message_id!==c)};return b(async()=>{o.value=!0;const c=await I({type:2});e.value=c.result.reverse(),o.value=!1}),(c,r)=>{const f=V,M=D,y=O;return a(),s("div",R,[t("div",T,[t("div",null,[t("img",{src:_(P)},null,8,W),Y]),d(f,{onClick:r[0]||(r[0]=i=>_(v).push({name:"home"})),style:{"margin-right":"30px"}},{default:E(()=>[F("返回")]),_:1})]),o.value?g((a(),s("div",Z,null,512)),[[M,o.value]]):U("",!0),e.value.length>0||o.value?(a(),s("div",$,[g((a(),s("ul",null,[(a(!0),s(B,null,S(n.value>e.value.length?e.value.length:n.value,i=>(a(),s("li",{key:i},[d(C,{message:e.value[i-1],onDeleteMessage:h},null,8,["message"])]))),128))])),[[y,p]])])):(a(),s("div",j,[t("img",{src:_(x),alt:"MessageEmpty"},null,8,q),z]))])}}});const se=w(A,[["__scopeId","data-v-e609c1c4"]]);export{se as default};
