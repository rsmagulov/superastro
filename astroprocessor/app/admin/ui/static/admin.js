// KB: row selection helper
window.kbSelectRow = function (rowEl) {
  if (!rowEl) return;

  const table = rowEl.closest("table");
  if (table) {
    table.querySelectorAll("tr.kb-row.is-selected").forEach((tr) => tr.classList.remove("is-selected"));
  }
  rowEl.classList.add("is-selected");
};

// Quick actions in fragment editor
window.kbQuickSetFragmentState = function (state) {
  const sel = document.getElementById("kb-frag-state");
  if (!sel) return;
  sel.value = state;

  const form = document.getElementById("kb-frag-form");
  if (!form) return;

  // submit via htmx (form has hx-post)
  if (form.requestSubmit) form.requestSubmit();
  else form.submit();
};

// After save: update selected row pill/state without reload
document.body.addEventListener("htmx:afterSwap", function (evt) {
  const target = evt.detail && evt.detail.target ? evt.detail.target : null;
  if (!target) return;
  if (target.id !== "kb-save-status") return;

  // response inserts <span data-kb-saved ...>
  const saved = target.querySelector("[data-kb-saved='1']");
  if (!saved) return;

  const kind = saved.getAttribute("data-kind");
  const id = saved.getAttribute("data-id");
  const state = saved.getAttribute("data-state");

  if (!kind || !id || !state) return;

  if (kind === "fragment") {
    const row = document.querySelector(`tr.kb-row[data-kind="fragment"][data-fragment-id="${id}"]`);
    if (!row) return;

    row.setAttribute("data-fragment-state", state);

    const pill = row.querySelector('[data-role="state-pill"]');
    if (pill) {
      // remove old pill-* and set new
      pill.className = pill.className
        .split(" ")
        .filter((c) => !c.startsWith("pill-"))
        .join(" ")
        .trim();
      pill.classList.add("pill-" + state);
      pill.textContent = state;
    }
  }
});
