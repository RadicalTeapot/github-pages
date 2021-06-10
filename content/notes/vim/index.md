---
title: "Vim"
summary: "Collection of vim notes"
weight: 1
---

## Registers

- Show content with `:reg`
- Paste from system clipboard register `"+p`
- Last yank register `"0`
- Last search register `"/`
- Last command register `":`
- Paste while editing `<C-r><register letter>` (e.g to paste from system clipboard, `<C-r>+`)
- Above works in commands so you can do `:%s/<C-r>0/<new value>/g` to change all occurences of the content of the last yank to **<new-value>**
  Or `:%s/<C-r>//<new value>/g` to use last search instead
- Also lettered registers contain macros (nice example [here](https://stackoverflow.com/a/7018760))

## Key bindings

- `<C-y>`: Scroll one line up
- `<C-e>`: Scroll one line down
- `<C-u>`: Scroll and move cursor half page up
- `<C-d>`: Scroll and move cursor half page down
- `zz`: Scroll so line is in middle of screen (beware of `<CapsLock>`!)
- `zt`: Scroll so line is at top of screen
- `zb`: Scroll so line is at bottom of screen

## Delete / Yank / Change from line X to line Y

- `:.,10d` / `:.,10c` / `:.,10y`: Delete, change or yank from current line to line 10 (included)
- `:10,.d` / `:10,.c` / `:10,.y`: Delete, change or yank from line 10 to current line (included)
- `:10,20d` / `:10,20c` / `:10,20y`: Delete, change or yank from line 10 to line 20 (included)
- `:.,$d` / `:.,$c` / `:.,$y`: Delete, change or yank from current line to end of file (included)

## Search for word under cursor

`*` will find the next occurrence of the word under the cursor.
It can be combined with `gn` to change occurrences quickly (i.e `*` then `Ncgn` to change the current occurrence and then `.` or `n` to either change the next occurrence or skip it).

## Jump to matching brackets

From [here](https://vi.stackexchange.com/a/16854)

| Block type | Move to previous | Move to next | Inner text obj | Outer text obj |
|---|---|---|---|---|
| curly br.  | [{               | }]           | iB             | aB             |
| parenth.   | [(               | )]           | ib             | ab             |
| square br. |                  |              | i[             | a[             |
| xml / html |                  |              | it             | at             |
| paragraph  | {                | }            | ip             | ap             |
| section    | [[ []            | ]] ][        |                |                |
| method     | [m [M            | ]m ]M        |                |                |

## Marks

### Commands

Lowercase marks are bound to current buffer / file
Uppercase marks are bound to files (lets you jump between files)

| Command   | Description                               |
|---|---|
| ma        | set mark a at current location            |
| 'a        | jump to line of mark a                    |
| \`a        | jump to position of a                     |
| d'a       | delete from current line to line of a     |
| d\`a       | delete from current char to position of a |
| :marks    | list all marks                            |
| :marks aB | list marks a and B                        |
| ]'        | Jump to next line with lowercase mark     |
| ['        | Jump to previous line with lowercase mark |
| ]\`        | Jump to next lowercase mark               |
| [\`        | Jump to previous lowercase mark           |

### Special marks

| Command  | Description                              |
|---|---|
| \`.       | Position of last change in buffer        |
| \`"       | Position of last exited current buffer   |
| \`0       | Last edited file                         |
| \`1       | Before last edited file (... till `9)    |
| ''       | Jump back to line where jumped from      |
| \`\`       | Jump back to position where jumped from  |
| \`[ or ]\` | Beginning / End of last change / yank    |
| \`< or >\` | Beginning / End of last visual selection |

## Misc

### Copy all lines containing a match to a register

Copy all lines containing `pattern` to `register` (replace by the register letter you want to use).

```vim
qregisterq
:g/pattern/y REGISTER
```

The first line clears the register.

The register letter has to be capitalized in the second line to append to it instead of replacing its content.

Optionally paste the register content

```vim
"registerp
```
