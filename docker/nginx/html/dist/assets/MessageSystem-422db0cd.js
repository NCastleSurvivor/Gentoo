import{f as I,_ as b,u as k,g as D}from"./index-429ff8e5.js";import{a as T,M as B}from"./MessageEmpty-30652268.js";/* empty css                   */import{f as C}from"./index-9b3e9b96.js";import{d as S,e as L,M as t,C as a,N as c,I as l,D as e,V as N,H as $,a7 as x,u as m,a0 as H,$ as M,T as V,Q as R,R as A,K as j,f as h,g as F,W as w,Z as K,_ as O,af as P,Y as Q,O as W,P as Y,aw as Z}from"./element-plus-dc5e6ec0.js";const q={class:"messagesystemitem-wrap"},z={class:"part1"},G={class:"details"},J=["innerHTML"],U={class:"details-date"},X={class:"part2"},ee={key:0,class:"content"},se=["innerHTML"],te={class:"button"},ae=["src"],ne=S({__name:"MessageSystemItem",props:{message:{}},emits:["deleteMessage"],setup(i,{emit:u}){const n=i,_=u,s=L(()=>C(n.message.createdAt)),p=async d=>{d==="delete"&&H.confirm("此操作将永久删除该消息, 是否继续?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(async()=>{(await I({message_id:n.message.message_id})).result_code===0?(M.success("删除成功!"),_("deleteMessage",n.message.message_id)):M.error("删除失败!")})};return(d,r)=>{const o=V,g=R,v=A,f=j;return t(),a("div",q,[c(o,{type:"flex",justify:"space-between"},{default:l(()=>[e("div",z,[e("div",G,[c(o,{type:"flex"},{default:l(()=>[e("span",{class:"details-inner",innerHTML:d.message.content},null,8,J)]),_:1}),c(o,{style:{"margin-top":"10px"},type:"flex"},{default:l(()=>[e("span",U,N(s.value),1)]),_:1})])]),e("div",X,[d.message.abstract?(t(),a("div",ee,[e("span",{innerHTML:d.message.abstract},null,8,se)])):$("",!0),c(f,{onCommand:p},{dropdown:l(()=>[c(v,null,{default:l(()=>[c(g,{command:"delete"},{default:l(()=>[x("删除消息")]),_:1})]),_:1})]),default:l(()=>[e("div",te,[e("img",{src:m(T)},null,8,ae)])]),_:1})])]),_:1})])}}});const oe=b(ne,[["__scopeId","data-v-afb53261"]]),le="/assets/MessageSystem-ebdd307a.svg",E=i=>(W("data-v-271b796c"),i=i(),Y(),i),ce={class:"messagesystem-wrap"},_e={class:"head"},de=["src"],ie=E(()=>e("span",null,"系统消息",-1)),re={key:0,"element-loading-background":"rgba(255, 255, 255, 0.7)",class:"loading"},me={key:1,class:"message-list"},ue={key:2,class:"empty"},pe=["src"],ge=E(()=>e("span",null,"暂无数据",-1)),ve=S({__name:"MessageSystem",setup(i){const u=k(),n=h(7),_=h(!1),s=h([]),p=()=>{n.value<s.value.length&&(n.value+=5)},d=r=>{s.value=s.value.filter(o=>o.message_id!==r)};return F(async()=>{_.value=!0;const r=await D({type:3});s.value=r.result.reverse(),_.value=!1}),(r,o)=>{const g=P,v=Q,f=Z;return t(),a("div",ce,[e("div",_e,[e("div",null,[e("img",{src:m(le)},null,8,de),ie]),c(g,{onClick:o[0]||(o[0]=y=>m(u).push({name:"home"})),style:{"margin-right":"30px"}},{default:l(()=>[x("返回")]),_:1})]),_.value?w((t(),a("div",re,null,512)),[[v,_.value]]):$("",!0),s.value.length>0||_.value?(t(),a("div",me,[w((t(),a("ul",null,[(t(!0),a(K,null,O(n.value>s.value.length?s.value.length:n.value,y=>(t(),a("li",{key:y},[c(oe,{message:s.value[y-1],onDeleteMessage:d},null,8,["message"])]))),128))])),[[f,p]])])):(t(),a("div",ue,[e("img",{src:m(B),alt:"MessageEmpty"},null,8,pe),ge]))])}}});const be=b(ve,[["__scopeId","data-v-271b796c"]]);export{be as default};