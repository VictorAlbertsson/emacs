(require 'multiple-cursors)

(defhydra hydra-multiple-cursors (:hint nil :color teal)
  "
 Up^^             Down^^           Miscellaneous           % 2(mc/num-cursors) cursor%s(if (> (mc/num-cursors) 1) \"s\" \"\")
------------------------------------------------------------------
 [_p_]   Next     [_n_]   Next     [_l_] Edit lines  [_0_] Insert numbers
 [_P_]   Skip     [_N_]   Skip     [_a_] Mark all    [_A_] Insert letters
 [_M-p_] Unmark   [_M-n_] Unmark   [_s_] Search      [_q_] Quit
 [_|_] Align with input CHAR       [Click] Cursor at point
                    [_<menu>_] Escape"
  ("l" mc/edit-lines)
  ("a" mc/mark-all-like-this)
  ("n" mc/mark-next-like-this :exit nil)
  ("N" mc/skip-to-next-like-this :exit nil)
  ("M-n" mc/unmark-next-like-this :exit nil)
  ("p" mc/mark-previous-like-this :exit nil)
  ("P" mc/skip-to-previous-like-this :exit nil)
  ("M-p" mc/unmark-previous-like-this :exit nil)
  ("|" mc/vertical-align :exit nil)
  ("s" mc/mark-all-in-region-regexp)
  ("0" mc/insert-numbers)
  ("A" mc/insert-letters)
  ("<mouse-1>" mc/add-cursor-on-click :exit nil)
  ;; Help with click recognition in this hydra
  ("<down-mouse-1>" ignore :exit nil)
  ("<drag-mouse-1>" ignore :exit nil)
  ("q" hydra-pop)
  ("<menu>" hydra-escape))
