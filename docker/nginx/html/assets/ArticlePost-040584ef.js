import{b,_ as B}from"./index-429ff8e5.js";/* empty css                   *//* empty css                 */import{n as m}from"./index-57f530b0.js";import{F as C}from"./More-0711e136.js";import{A as E}from"./ArticlePersonalCenterItem-af2b7470.js";import{d as D,f as i,e as P,g as V,C as o,N as p,W as F,G as n,I as c,n as I,T as S,Y as j,M as t,D as v,V as G,Z as f,_ as y,H as g,a3 as M}from"./element-plus-dc5e6ec0.js";import"./constants-ff0dbeed.js";/* empty css                   */import"./index-a3c3f250.js";import"./index-9b3e9b96.js";const R={class:"articlepost-wrap"},T={style:{"margin-left":"20px"}},H={class:"title"},U=D({__name:"ArticlePost",setup(W){const d=b(),r=i(!1),a=i([]),e=i([]),u=i(0),h=P(()=>e.value.length),x=async s=>{u.value=1,a.value=s,await I(),u.value=0},w=async s=>{s&&(r.value=!0,e.value.splice(0),(await m({user_id:Number(d.params.user_id)})).result.forEach(l=>{e.value.push(l)}),e.value.reverse(),a.value=e.value,r.value=!1)};return V(async()=>{r.value=!0;const s=await m({user_id:Number(d.params.user_id)});e.value=s.result,e.value.reverse(),a.value=e.value,r.value=!1}),(s,A)=>{const l=S,L=M,k=j;return t(),o("div",R,[p(C,{"article-list-all":e.value,onSendArticleList:x},null,8,["article-list-all"]),F((t(),n(l,{style:{"margin-top":"30px"}},{default:c(()=>[p(l,null,{default:c(()=>[v("div",T,[v("span",H,"发布文章("+G(h.value)+")",1)])]),_:1}),u.value===0?(t(),n(l,{key:0,type:"flex",justify:"center",style:{width:"100%","flex-wrap":"wrap"}},{default:c(()=>[(t(!0),o(f,null,y(a.value,(_,N)=>(t(),n(E,{key:N,articleList:_,onGetArticleList:w},null,8,["articleList"]))),128)),(t(!0),o(f,null,y(new Array(2-((a.value.length-1)%2+1)),_=>(t(),o("div",{style:{padding:"9px 14px",margin:"0 60px 30px 0",width:"502px"},key:_}))),128))]),_:1})):g("",!0),a.value.length===0?(t(),n(l,{key:1,type:"flex",justify:"center",style:{width:"100%"}},{default:c(()=>[p(L,{description:"该分类下ta还暂未发布过文章哦~去别处看看吧！"})]),_:1})):g("",!0)]),_:1})),[[k,r.value]])])}}});const te=B(U,[["__scopeId","data-v-4fefbe07"]]);export{te as default};