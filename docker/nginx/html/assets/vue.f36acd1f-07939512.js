import{i as o,h as f}from"./index-429ff8e5.js";import{f as c,ax as d,w as v,aa as i,b as l,c as h,ay as m}from"./element-plus-dc5e6ec0.js";function U(t,a={}){const e=a.head||o();if(e)return e.ssr?e.push(t,a):p(e,t,a)}function p(t,a,e={}){const s=c(!1),n=c({});d(()=>{n.value=s.value?{}:f(a)});const r=t.push(n.value,e);return v(n,u=>{r.patch(u)}),m()&&(i(()=>{r.dispose()}),l(()=>{s.value=!0}),h(()=>{s.value=!1})),r}export{U as u};