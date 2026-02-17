function kbSelectRow(row) {
  document.querySelectorAll("tr.kb-row.is-selected").forEach((el) => el.classList.remove("is-selected"));
  if (row) row.classList.add("is-selected");
}

// 1) Если кликнули по строке — выделяем
document.addEventListener("click", (e) => {
  const row = e.target.closest && e.target.closest("tr.kb-row");
  if (row) kbSelectRow(row);
});

// 2) Если запрос ушёл через HTMX (клик по tr / по ссылке внутри / по span и т.п.) — тоже выделяем
document.body.addEventListener("htmx:beforeRequest", (e) => {
  const elt = e.detail && e.detail.elt;
  const row = elt && elt.closest ? elt.closest("tr.kb-row") : null;
  if (row) kbSelectRow(row);
});
