import{u as K,b as Q,a as X,_ as P}from"./index-429ff8e5.js";/* empty css                   */import{i as Z,g as ee,j as se,k as te,m as U}from"./index-57f530b0.js";import{u as oe}from"./vue.f36acd1f-07939512.js";import{d as E,f as r,e as y,w as H,W as ae,M as $,C,D as s,N as n,I as u,a7 as le,V as i,H as S,u as b,S as w,F as ne,$ as I,T as B,Y as ue,O as ie,P as re,U as ce}from"./element-plus-dc5e6ec0.js";const de="/assets/MyArticles-fae5363e.svg",ve="/assets/MyCollections-c1cd2a86.svg",_e="/assets/MyFocus-1cdfaae0.svg",pe="/assets/MyData-0a63fc33.svg",fe="/assets/MyInfo-fe4a3020.svg",g=x=>(ie("data-v-428bdc84"),x=x(),re(),x),me={class:"personalheader-wrap"},ye={class:"background"},ge=["src"],he={class:"userhead"},Me=["src"],xe={class:"username"},ke={class:"selfintroduce"},be={class:"part-two"},we=g(()=>s("span",{class:"title"},"关注数",-1)),$e={class:"num"},Ce=g(()=>s("span",{class:"title"},"粉丝数",-1)),Ie={class:"num"},Ne=g(()=>s("span",{class:"title"},"文章点赞量",-1)),Fe={class:"num"},Se=g(()=>s("span",{class:"title"},"文章收藏量",-1)),je={class:"num"},De=g(()=>s("span",{class:"title"},"文章发布数",-1)),Ae={class:"num"},Le=g(()=>s("span",null,"关注",-1)),Re=[Le],Ue=g(()=>s("span",null,"取消关注",-1)),He=[Ue],Pe=["src"],Ee=["src"],Be=["src"],ze=["src"],Oe=["src"],Te=E({__name:"PersonalHeader",setup(x){const j=K(),N=Q(),{userStore:h}=X(),k=r(!1),_=r(!1),p=r(!1),a=r({background_photo:"",header_photo:"",user_name:"",sign:"",follow_count:0,follower_count:0,total_like:0,total_collect:0,total_artcile:0}),c=r(0),F=r(0),D=r([14,144,274,414,544]),M=r(1),A=r(["MyArticles","MyCollection","MyFocusList","MyData","MyInfo"]),f=r(["behovered","behovered","behovered","behovered","behovered"]),z=r(["behovered","behovered","behovered","behovered","behovered"]),O=y(()=>a.value.background_photo),T=y(()=>a.value.header_photo),V=y(()=>a.value.user_name),W=y(()=>a.value.sign),Y=y(()=>a.value.follow_count),q=y(()=>a.value.follower_count),G=y(()=>a.value.total_artcile);H(()=>N.name,async(l,e)=>{f.value=z.value.slice(0);let t;l==="MyFocusList"||l==="MyFansList"?t=2:t=A.value.indexOf(String(l)),f.value[t]="behovered beclicked",F.value=D.value[t],M.value=t+1},{immediate:!0}),H(()=>N.params.user_id,async(l,e)=>{if(l!==e){k.value=!0,c.value=Number(l),c.value===h.userInfo.user_id?_.value=!0:_.value=!1;const t=await Z({user_id:c.value});t.result_code===0&&t.result.length>0&&t.result.forEach(J=>{J.second_user_id===c.value&&(p.value=!0)});const{result:v}=await ee({user_id:c.value});oe({title:`${v.name}的个人空间`,meta:[{name:"description",content:`这是${v.name}的个人空间，欢迎来到这里。看看有没有自己中意的文章吧~！`},{name:"author",content:v.name},{name:"viewport",content:"width=device-width, initial-scale=1.0"},{name:"charset",content:"utf-8"}]}),a.value.user_name=v.name,a.value.sign=v.signature,a.value.header_photo=v.headphoto,a.value.background_photo=v.backgroundphoto,a.value.total_artcile=v.article_num;const o=await se({user_id:c.value});o.result_code===0&&(a.value.total_like=o.result);const R=await te({user_id:c.value});R.result_code===0&&(a.value.total_collect=R.result),k.value=!1}},{immediate:!0});const m=l=>{j.push({name:A.value[l-1]})},d=l=>{F.value=D.value[l-1]},L=async l=>{if(l===0){const e=await U({first_user_id:h.userInfo.user_id,second_user_id:c.value,action_type:l});e.result_code===0?(p.value=!p.value,I({type:"success",message:"关注成功"})):I({type:"error",message:e.result_msg||"关注失败"})}else{const e=await U({first_user_id:h.userInfo.user_id,second_user_id:c.value,action_type:l});e.result_code===0?(p.value=!p.value,I({type:"success",message:"取消关注成功"})):I({type:"error",message:e.result_msg||"取消关注失败"})}};return(l,e)=>{const t=B,v=ue;return ae(($(),C("div",me,[s("div",ye,[s("img",{src:O.value},null,8,ge)]),n(t,{class:"part-one"},{default:u(()=>[n(t,{style:{"margin-top":"20px"}},{default:u(()=>[s("div",null,[s("div",he,[s("img",{src:T.value},null,8,Me)])]),s("div",null,[n(t,{type:"flex",style:{margin:"0 0 15px"}},{default:u(()=>[s("span",xe,[le(i(V.value)+" ",1),s("span",null,"UID:"+i(c.value),1)])]),_:1}),n(t,{style:{"margin-top":"7px"}},{default:u(()=>[s("span",ke,i(W.value),1)]),_:1}),n(t,{type:"flex",justify:"space-between",style:{"align-items":"center",width:"1100px"}},{default:u(()=>[s("div",be,[s("div",{onClick:e[0]||(e[0]=o=>m(6))},[we,n(t,{type:"flex",justify:"center"},{default:u(()=>[s("span",$e,i(Y.value),1)]),_:1})]),s("div",{onClick:e[1]||(e[1]=o=>m(6))},[Ce,n(t,{type:"flex",justify:"center"},{default:u(()=>[s("span",Ie,i(q.value),1)]),_:1})]),s("div",null,[Ne,n(t,{type:"flex",justify:"center"},{default:u(()=>[s("span",Fe,i(a.value.total_like),1)]),_:1})]),s("div",null,[Se,n(t,{type:"flex",justify:"center"},{default:u(()=>[s("span",je,i(a.value.total_collect),1)]),_:1})]),s("div",null,[De,n(t,{type:"flex",justify:"center"},{default:u(()=>[s("span",Ae,i(G.value),1)]),_:1})])]),!_.value&&!p.value?($(),C("div",{key:0,onClick:e[2]||(e[2]=o=>L(0)),class:"button"},Re)):S("",!0),!_.value&&p.value?($(),C("div",{key:1,onClick:e[3]||(e[3]=o=>L(1)),class:"button"},He)):S("",!0)]),_:1})])]),_:1})]),_:1}),n(t,{class:"part-three",type:"flex",justify:"start"},{default:u(()=>[s("div",{onMouseenter:e[4]||(e[4]=o=>d(1)),onMouseleave:e[5]||(e[5]=o=>d(M.value)),onClick:e[6]||(e[6]=o=>m(1))},[s("img",{src:b(de),alt:"MyArticles"},null,8,Pe),s("span",{class:w(f.value[0])},i(_.value?"我的":"ta的")+"文章",3)],32),s("div",{onMouseenter:e[7]||(e[7]=o=>d(2)),onMouseleave:e[8]||(e[8]=o=>d(M.value)),onClick:e[9]||(e[9]=o=>m(2))},[s("img",{src:b(ve),alt:"MyCollections"},null,8,Ee),s("span",{class:w(f.value[1])},i(_.value?"我的":"ta的")+"收藏",3)],32),s("div",{onMouseenter:e[10]||(e[10]=o=>d(3)),onMouseleave:e[11]||(e[11]=o=>d(M.value)),onClick:e[12]||(e[12]=o=>m(3))},[s("img",{src:b(_e),alt:"MyFocus"},null,8,Be),s("span",{class:w(f.value[2])},i(_.value?"我的":"ta的")+"关注",3)],32),s("div",{onMouseenter:e[13]||(e[13]=o=>d(4)),onMouseleave:e[14]||(e[14]=o=>d(M.value)),onClick:e[15]||(e[15]=o=>m(4))},[s("img",{src:b(pe),alt:"MyData"},null,8,ze),s("span",{class:w(f.value[3])},i(_.value?"我的":"ta的")+"数据",3)],32),_.value?($(),C("div",{key:0,onMouseenter:e[16]||(e[16]=o=>d(5)),onMouseleave:e[17]||(e[17]=o=>d(M.value)),onClick:e[18]||(e[18]=o=>m(5))},[s("img",{src:b(fe),alt:"MyInfo"},null,8,Oe),s("span",{class:w(f.value[4])},"个人资料",2)],32)):S("",!0),s("div",{class:"line",style:ne({left:`${F.value}px`})},null,4)]),_:1})])),[[v,k.value]])}}});const Ve=P(Te,[["__scopeId","data-v-428bdc84"]]),We={class:"index"},Ye=E({__name:"index",setup(x){return(j,N)=>{const h=B,k=ce("router-view");return $(),C("div",We,[n(h,{style:{margin:"0 auto",width:"1350px"}},{default:u(()=>[n(Ve)]),_:1}),n(h,{style:{margin:"40px auto 30px",width:"1350px"}},{default:u(()=>[n(k)]),_:1})])}}});const Xe=P(Ye,[["__scopeId","data-v-978c0682"]]);export{Xe as default};
