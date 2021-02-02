## Main keys:
C -> Ctrl.
M -> Alt, Esc.
S -> Shift.
X -> Numeric counter, entered with modifier, e.g. M X.
N -> Name, e.g. name of a file.
DEL -> Backspace.
SPC -> Spacebar.
V - Activated visual mode.

C-u X command -	repeat command X times.
M X command - repeat command X times.


## Basic commands:
C-x C-c - exit emacs (C should be pressed down).
C-g - interrupt currently running command, reset currently entered command, etc.
C-x z - repeat the last command.
C-x Esc Esc - put the last command into the mini buffer.
(after put the last command) M-p - put older command.
M-x man - read man pages.
M-x calendar - start the embedded calendar.
(while in the calendar) M-x holidays - show list of holidays.
(while in the calendar) x - highlight all holidays in the calendar.


## Help
C-h ? - open help.
C-h k - describe what the provided key does, open detailed documentation if possible.
C-h c - describe what the provided key does.
C-h f - describe what the provided command does.
C-h v - describe the provided variable.
C-h a - search by part of name among the available commands.
C-h i - read interactive manuals of the installed packages.


## Navigation
C-v - move one screen down.
X C-v - move screen X lines down.
M-v - move one screen up.
X M-v - move screen X lines up.

C-l - center screen on the cursor.

C-n - move one line down.
C-p - move one line up.
C-f - move one char right.
C-b - move one char back.

M-f - move one word right.
M-b - move one word back.

C-a - move to the beginning of the string.
C-e - move to the end of the string.

M-a - move to the beginning of a sentence.
M-e - move to the end of a sentence.

M-} - move forward one paragraph.
M-{ - move backward one paragraph.

M-S-< - move to the beginning of the file.
M-S-> - move to the end of the file.

M-g M-g X - move cursor to line number X.

C-s - start incremental search in the area after the cursor.
C-s C-s - repeat last forward incremental search.
M-s w - start incremental search by exact word.
C-s C-w - start incremental search by part of the text from the cursor's position to the end of the word.
C-s C-y - start incremental search by part of the text from the cursor's position to the end of the line.
C-s M-y - search by the cut text (use M-p and M-n to cycle through criteria).
C-r - start incremental search in the area before the cursor.
C-r C-r - repeat last backward incremental search.
(during search) C-s - next match.
(during search) DEL - previous match.

C-M-s - start forward incremental regexp search.
C-M-r - start backward incremental regexp search.
(during search) C-M-% - enter to the query replace mode. 


## Editing
X * - insert X * symbols.
C-x i - insert content of a file after the cursor's position.
C-d - delete the char under the cursor.
M-d - cut text from the cursor to the end of the word.
M-DEL - cut text from the cursor to the beginning of the word.

C-k - cut text from cursor to the end of the string.
M-k - cut text from the cursor to the end of the sentence.

C-y - paste text from the last buffer.
C-y M-y - cycle forward through the buffers on each M-y key press and paste buffer's content.

C-\ - undo changes.
C-- - undo changes.
(move after doing undo) - undo the last undo command.

C-t - swap two letters (transpose).
M-t - swap two words (transpose).
C-x C-t - swap two lines (transpose).

C-q Tab - insert a tab.

M-x replace-string A B - replace all strings containing A with B.

M-% - interactive replace.
(while in replace) y - replace the current instance.
(while in replace) SPACE - replace the current instance.
(while in replace) n - skip replace of the current instance.
(while in replace) DEL - skip replace of the current instance.
(while in replace) . - replace the current instance and quite.
(while in replace) , - replace the current instance and see the result.
(while in replace) ! - replace the rest and don't ask.
(while in replace) ^ - go back to previous instance.
(while in replace) E - modify the replacement string.
(while in replace) C-r - enter the recursive edit mode.
(while in replace) C-w - delete this instance and enter the recursive edit mode.
(while in replace) C-M-c - exit the recursive edit mode.
(while in replace) C-] - exit the recursive edit and interactive replace

M-c - capitalize letter of the word after the cursor.
M-u - capitalize the word after the cursor.
M-- M-u - capitalize the word before the cursor.
M-l - put the word after the cursor in lower case.
M-- M-l - put the word before the cursor in lowercase.

M-/ - auto complete the entered word (repeat to cycle through suggestions).

M-; - insert commentary at the end of current string.
M-j - continue commentary on the next string.
M-x kill-comment - removes a commentary line.


## Visual block
C-SPC - start visual block selection.
C-@ - start visual block selection.
M-h - mark the paragraph.
C-x h - mark the entire file.
V C-w - cut the region.
V M-w - copy the region.
V C-x C-x - swap mark and cursor.
C-x r k - delete a rectangle.
C-x r y - insert a rectangle.
C-x r o - insert a blank rectangle.
C-x r c - clear a rectangle.
C-x r t - replace a rectangle.


## Window management
C-x 0 - close the current window.
C-x 1 - close all windows except the current.
C-x 2 - split the current window horizontally.
C-x 3 - split the current window vertically.
C-M-v - scroll in the neighbor window.
C-x o - move cursor to the neighbor window.
C-x 4 f - open target file in another window.
C-x 4 b - open target buffer in another window.
C-x 4 r - open the file as read-only in a new window.
C-x ^ - increase height of the current window.
C-x } - increase width of the current window.
M-x shrink-window - decrease height of the current window.
C-x { - decrease width of the current window.


## Files
C-x C-f - open file.
C-x C-v - open another file instead of the currently opened.

C-x C-s - save changes to the file.
C-x C-w - save the file under new name.


## Buffers
C-x C-b - show list of open buffers.
(while browsing buffers list) d - mark a buffer for deletion.
(while browsing buffers list) k - mark a buffer for deletion.
(while browsing buffers list) x - execute marked commands.
(while browsing buffers list) u - remove mark from a buffer.
(while browsing buffers list) s - mark a buffer for saving.
(while browsing buffers list) ~ - mark the buffer as unmodified.
(while browsing buffers list) % - toggle read-only mode.
(while browsing buffers list) 1 - open a buffer in the current window.
(while browsing buffers list) m - mark a buffer to be opened in a window.
(while browsing buffers list) v - display the buffers marked with m in several windows.
C-x b - create empty buffer (if name is omitted, the last closed buffer is shown).
C-x b N - open the buffer named N.
C-x b *Messages* - open the text editor's messages buffer.
C-x s - save the buffers associated with files.
C-x -> - cycle through the open buffers.
C-x <- - cycle through the open buffers.
C-x k - kill buffer.
M-x rename-buffer - rename the current buffer.
C-x C-q - toggle read-only mode.


## Spellchecking
M-x ispell-buffer - check whole open buffer with ispell.
(while in spell correction mode) r - replace the misspelled word manually.
(while in spell correction mode) R - enter in the query-replace mode.
(while in spell correction mode) a - ignore the misspelled word for all buffers.
(while in spell correction mode) a - ignore the misspelled word for this buffers.

M-$ - spellcheck the word under the cursor.
M-Tab - language auto completion.
M-x flyspell-mode - check spelling on the fly.
M-x flyspell-prog-mode - check spelling only in comments.


## Work modes
M-x fundamental-mode - switch to the fundamental mode (default).
M-x text mode - switch to the text mode to edit basic text.
M-x ov TAB - switch to the overwrite mode.
M-x whitespace-mode - show tabs, spaces and line endings.


## Auto fill mode
M-x auto-fill-mode - enable the auto fill mode (automatically break line if it is too long).
M-x refill-mode - same as auto fill mode, but reformat paragraphs automatically.
C-x f - change max line length (70 is default).
M-q - reformat the paragraph under the cursor.


## Abbreviations mode
M-x abbrev-mode - start abbreviation mode.
C-x a i g - add inverse global abbreviation for the last typed word.
C-x a i l - add inverse local abbreviation for the last typed word.
M-x unexpand-abbrev - undo the last abbreviation.
M-x edit-abbrevs - edit the abbreviations list manually (only deletion works safe).
(while editing abbrevs) M-x write-abbrev-file - save changes to the abbreviations list.


## Bookmarks
C-x r b - jump to a bookmark.
C-x r l - open the list of bookmarks.
C-x r m - set bookmark at the current position of the cursor.
M-x bookmark-delete - delete a bookmark.
M-x bookmark-rename - rename a bookmark.
(while in the bookmarks list) f - display the bookmarked file with the cursor set at bookmarks location.
(while in the bookmarks list) j - display the bookmarked file with the cursor set at bookmarks location.
(while in the bookmarks list) d - mark a bookmark for deletion.
(while in the bookmarks list) x - delete the marked bookmarks.
(while in the bookmarks list) Del - remove the deletion mark.
(while in the bookmarks list) r - rename a bookmark.
(while in the bookmarks list) m - mark a bookmark to display associated files later.
(while in the bookmarks list) v - view the bookmarks marked with m key.
(while in the bookmarks list) t - toggle display names of the bookmarks.
(while in the bookmarks list) e - edit an annotation of a bookmark.
(while in the bookmarks list) a - display an annotation of a bookmark.
(while in the bookmarks list) A - display all available annotations.


## Shell integration
M-! - execute arbitrary shell command.
M-| - put the marked region as input to the shell command.
C-u M-! - paste output of the current shell command into the buffer.
M-x shell - open shell in Emacs.
(while in shell mode) M-p - recall last command.
(while in shell mode) C-c C-c - interrupt currently running shell command.
(while in shell mode) C-c C-o - wipe output of the last shell command.
(while in shell mode) C-c C-r - move to beginning of the last command's output.
(while in shell mode) C-c C-e - move to the end of the last command's output.
(while in shell mode) M-x rename-uniquely - rename current shell buffer in order to start another one.
(while in shell mode) M-x send-invisible - send text without echo.


## Dired
C-x d - start Dired.
C-x C-j - open current buffer's folder in Dired.
(while in directory editor) s - toggle sorting (by mtime or name).
(while in directory editor) n - move to the next line.
(while in directory editor) p - move to the previous line.
(while in directory editor) v - open a file under the cursor in the view mode.
(while in the view mode) - q - close the opened file.
(while in the view mode) - s - start incremental search.
(while in directory editor) e - edit a file under the cursor.
(while in directory editor) d - mark a file under the cursor for deletion.
(while in directory editor) u - unmark a file under the cursor.
(while in directory editor) # - mark all the autosave files for deletion.
(while in directory editor) ~ - mark all the backup files for deletion.
(while in directory editor) x - delete all the marked files.
(while in directory editor) D - delete a file under the cursor or marked files.
(while in directory editor) C - copy a file under the cursor or marked files.
(while in directory editor) R - rename a file under the cursor or marked files.
(while in directory editor) m - mark a file under the cursor.
(while in directory editor) * - mark a file under the cursor. Any further commands will be launched for the marked file.
(while in directory editor) * * - mark executables.
(while in directory editor) * / - mark folders.
(while in directory editor) * @ - mark symbolic links.
(while in directory editor) %l - convert names of the marked files to lowercase.
(while in directory editor) %u - convert names of the marked files to uppercase.
(while in directory editor) %m - mark all files which name is matching the following regexp.
(while in directory editor) %g - mark all files which content is matching the following regexp.
(while in directory editor) Z - compress a file under the cursor.
(while in directory editor) = - compare marked files.
(while in directory editor) ! - perform command on a file under the cursor (use * as a placeholder of file name in command).
(while in directory editor) g - refresh the files list.
(while in directory editor) M-Del - unmark all files.
(while in directory editor) t - toggle marks on all files.
(while in directory editor) + - create a directory.
(while in directory editor) A - search in files content by regexp (use M- to move to the next match).
(while in directory editor) Q - replace matching text in files content.
(while in directory editor) ^ - move to the parent folder.
(while in directory editor) > - move cursor to the next folder.
(while in directory editor) < - move cursor to the previous folder.
(while in directory editor) i - insert subdirectory into the current buffer.


## Git
C-x v g - git blame.
(while in blame mode) = - open diff of particular commit.
(while in blame mode) q - close the opened diff.


## Macros
C-x ( - start recording.
C-g - stop recording.
C-x ) - stop recording.
C-x e - execute the last keyboard macro.
C-x C-k e - edit a macro.
(while editing a macro) C-c C-c - stop macro editing.
C-x C-k C-d - delete a macro from the macro ring.
C-x C-k C-t - swap positions of two macros.
C-c C-k C-p - cycle to previous macro in the ring.
C-c C-k C-n - cycle to next macro in the ring.
C-x C-k b - bind a key (sequence) to a macro.
C-x C-k n - name the last macro.
M-x insert-kbd-macro - put a macro to a buffer.
(while recording macro) C-u C-x q - start recursive edit. 
(while recording macro) C-M-c - stop recursive edit.
(while recording macro) C-x q - place a query to a user.
C-x C-k r - apply a macro to a region.


## Compilation
M-x compile - compile a program.
(while in the compilation buffer) C-x ` - go to next compilation error and open corresponding error source.
(while in the compilation buffer) M-n - move to next compilation error.
(while in the compilation buffer) M-p - move to previous compilation error.
(while in the compilation buffer) C-c C-c - open source code related to current error message.
(while in the compilation buffer) Space - scroll down one screen.
(while in the compilation buffer) Del - scroll up one screen.


## Indentation
C-M-\ - indent each line between the cursor and mark.
M-m - move to the first non-blank character of a line.
M-^ - join this line with the previous one.


## Tags
M-x visit-tags-table - load content of the TAGS file into emacs.
M-. - find tag (can pick the word under the cursor).
M-x tags-search - search among tags by regular expression.
M-x list-tags - list all tags in the table.


## C++ mode
M-e - move to the end of the current statement.
M-a - move to the beginning of the current statement.
M-q - reformat the commentary block.
C-M-a - move to the beginning of the functions body.
C-M-e - move to the end of the functions body.
C-M-h - mark the functions body as a region.
C-c C-q - indent the functions body.
C-j } - indent the code block with the opening {.
M-x set-style - choose indentation coding style. 
C-c C-e - expand the macro under the cursor.
C-c : - insert ::.
