param(
  [Parameter(ValueFromRemainingArguments=$true)]
  [string[]]$Args
)

python -m app.knowledge.builder @Args
