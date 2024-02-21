import{u as R,a as E,_ as I}from"./index-429ff8e5.js";/* empty css                   */import{d as S,f as c,W as d,M as m,C as w,D as e,X as r,H as L,E as v,Y as K,O as N,P as T,g as $,N as b,I as j,T as W,F as B}from"./element-plus-dc5e6ec0.js";import{l as F,g as M,a as A,b as D,r as H}from"./index-57f530b0.js";import{u as z}from"./vue.f36acd1f-07939512.js";const o=u=>(N("data-v-261f6799"),u=u(),T(),u),O={class:"loginwindow-wrap"},P={key:0},X=o(()=>e("div",{class:"title"},[e("span",null,"登录")],-1)),Y={class:"form"},q={style:{margin:"40px 0 0"}},G=o(()=>e("span",null,"账号",-1)),J={style:{margin:"20px 0 0"}},Q=o(()=>e("span",null,"密码",-1)),Z=o(()=>e("span",null,"还未注册？点击此处注册！",-1)),ee=[Z],te=o(()=>e("div",null,[e("span",null,"登录")],-1)),se=[te],oe={key:1},ne=o(()=>e("div",{class:"title"},[e("span",null,"注册")],-1)),ae={class:"form"},le={style:{margin:"40px 0 0"}},ie={style:{display:"flex","justify-content":"space-between","align-items":"center",width:"100%"}},de=o(()=>e("span",null,"用户名",-1)),ue={style:{display:"flex","justify-content":"space-between","align-items":"center",margin:"20px 0 0",width:"100%"}},re=o(()=>e("span",null,"账号",-1)),ce={style:{display:"flex","justify-content":"space-between","align-items":"center",margin:"20px 0 0",width:"100%"}},_e=o(()=>e("span",null,"密码",-1)),pe=o(()=>e("span",null,"返回",-1)),ve=[pe],me=o(()=>e("div",null,[e("span",null,"注册")],-1)),we=[me],ye=S({__name:"LoginWindow",setup(u){const _=R(),{userStore:y,keywordStore:h,articleLabelStore:f}=E(),a=c({account:"",password:""}),n=c({name:"",account:"",password:""}),l=c(!0),g=c(!1),x=i=>{i.key==="Enter"&&k()},k=async()=>{if(g.value=!0,!a.value.account||!a.value.password)v({title:"账号/密码未填好！",type:"error"});else{const i=await F({...a.value});if(i.result_code===0){localStorage.setItem("token",i.result.token);const t=await M({user_id:i.result.user_id});t.result_code===0&&(y.setUserInfo(t.result),y.setLogin(!0));const p=await A({user_id:i.result.user_id});p.result_code===0&&h.setKeywordList(p.result);const s=await D();s.result_code===0&&f.setArticleLabels(s.result),v({title:"登录成功！",message:`${t.result.name}，欢迎回来！`,type:"success"}),_.push({name:"home"})}}g.value=!1},C=()=>{l.value=!l.value,a.value={account:"",password:""}},U=async()=>{n.value.name&&n.value.account&&n.value.password?(await H(n.value)).result_code===0&&(l.value=!l.value,v({title:"注册成功！",message:"快去登录吧~",type:"success"})):v({title:"注册必填项未填好！",type:"error"})},V=()=>{l.value=!l.value,a.value={account:"",password:""}};return(i,t)=>{const p=K;return d((m(),w("div",O,[l.value?(m(),w("div",P,[X,e("div",Y,[e("div",q,[e("div",null,[G,d(e("input",{onKeydown:t[0]||(t[0]=s=>x(s)),type:"text",placeholder:"请输入您的账号","onUpdate:modelValue":t[1]||(t[1]=s=>a.value.account=s)},null,544),[[r,a.value.account]])]),e("div",J,[Q,d(e("input",{onKeydown:t[2]||(t[2]=s=>x(s)),type:"password",placeholder:"请输入您的密码","onUpdate:modelValue":t[3]||(t[3]=s=>a.value.password=s)},null,544),[[r,a.value.password]])])])]),e("div",{class:"register",onClick:C},ee),e("div",{class:"submit",onClick:t[4]||(t[4]=s=>k())},se)])):L("",!0),l.value?L("",!0):(m(),w("div",oe,[ne,e("div",ae,[e("div",le,[e("div",ie,[de,d(e("input",{type:"text",placeholder:"请填写您的用户名","onUpdate:modelValue":t[5]||(t[5]=s=>n.value.name=s)},null,512),[[r,n.value.name]])]),e("div",ue,[re,d(e("input",{type:"text",placeholder:"请填写您的账号","onUpdate:modelValue":t[6]||(t[6]=s=>n.value.account=s)},null,512),[[r,n.value.account]])]),e("div",ce,[_e,d(e("input",{type:"password",placeholder:"请输入您的密码","onUpdate:modelValue":t[7]||(t[7]=s=>n.value.password=s)},null,512),[[r,n.value.password]])])])]),e("div",{class:"register",onClick:V},ve),e("div",{class:"submit",onClick:t[8]||(t[8]=s=>U())},we)]))])),[[p,g.value]])}}});const fe=I(ye,[["__scopeId","data-v-261f6799"]]),ge={class:"index"},he=S({__name:"index",setup(u){z({title:"欢迎来到这里呀~",meta:[{name:"author",content:"nonhana"},{name:"viewport",content:"width=device-width, initial-scale=1.0"},{name:"charset",content:"utf-8"}]});const _=c("0%");return $(()=>{setTimeout(()=>{_.value="100%"},600)}),(y,h)=>{const f=W;return m(),w("div",ge,[b(f,{type:"flex",justify:"center"},{default:j(()=>[e("div",{class:"window",style:B({opacity:_.value})},[b(fe)],4)]),_:1})])}}});const Se=I(he,[["__scopeId","data-v-033812c5"]]);export{Se as default};