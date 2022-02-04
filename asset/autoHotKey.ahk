;#Include %A_ScriptDir%/IME20121110/IME/UTF8/IME.ahk

;; #Warn  ; Enable warnings to assist with detecting common errors.
;;;; := と = は挙動が違うので注意
;;;; If (expr) と If exprは挙動が違うので注意
;;;; 文字列を書くところでは、%var% か str、変数を書くところでは、var か "str"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ahk
;;;; Ctrl + Alt + R でスクリプトを再読み込み.
;;;; Ctrl + Alt + E でスクリプトを編集.
^!R::Reload
^!E::Edit

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Winシャットダウンコマンド
#Esc::Shutdown, 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; #F13をアンバインド
#F13::Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; arrows
;>!H::Send, {left}
;>!J::Send, {Down}
;>!K::Send, {Up}
;>!L::Send, {Right}
;+>!H::Send, +{left}
;+>!J::Send, +{Down}
;+>!K::Send, +{Up}
;+>!L::Send, +{Right}
;#>!H::Send, #{left}
;#>!J::Send, #{Down}
;#>!K::Send, #{Up}
;#>!L::Send, #{Right}
;#+>!H::Send, #+{Left}
;#+>!L::Send, #+{Right}
;^>!H::Send, ^{left}
;^>!J::Send, ^{Down}
;^>!K::Send, ^{Up}
;^>!L::Send, ^{Right}
;^+>!H::Send, ^+{left}
;^+>!L::Send, ^+{Right}

F13 & H::Send, {Blind}{Left}
F13 & J::Send, {Blind}{Down}
F13 & K::Send, {Blind}{Up}
F13 & L::Send, {Blind}{Right}
;F13 & A::Send, {Home}
;F13 & E::Send, {End}
;^A::Send, {Home}
;^E::Send, {End}

#If GetKeyState("LAlt", "P") && !GetKeyState("Shift", "P")
  F13 & H::Send, {Home}
  F13 & L::Send, {End}
  F13 & J::Send, ^{End}
  F13 & K::Send, ^{Home}
#If GetKeyState("LAlt", "P") && GetKeyState("Shift", "P")
  F13 & H::Send, +{Home}
  F13 & L::Send, +{End}
  F13 & J::Send, ^+{End}
  F13 & K::Send, ^+{Home}
#If

F13 & q::Send, {Blind}!{q}
F13 & w::Send, {Blind}!{w}
F13 & e::Send, {Blind}!{e}
F13 & r::Send, {Blind}!{r}
F13 & t::Send, {Blind}!{t}
F13 & a::Send, {Blind}!{a}
F13 & s::Send, {Blind}!{s}
F13 & d::Send, {Blind}!{d}
F13 & f::Send, {Blind}!{f}
F13 & g::Send, {Blind}!{g}
F13 & z::Send, {Blind}!{z}
F13 & x::Send, {Blind}!{x}
F13 & c::Send, {Blind}!{c}
F13 & b::Send, {Blind}!{b}
F13 & n::Send, {Blind}!{n}
F13 & m::Send, {Blind}!{m}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; NumLock
;;;; NumLock長押しでAlwaysOffを有効化
;;;; NumLock連続押しでAlwaysOffを解除
~NumLock::
  KeyWait, NumLock, T0.3
  If (ErrorLevel) {
    SetNumLockState, AlwaysOff
  } Else {
    Input, outVar, T0.2 L1, {NumLock}
    IfInString, ErrorLevel, EndKey:, {
      SetNumlockState, On
    }
  }
  Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; tenkey
;#If GetKeyState("NumLock", "P")
;  M::Send {Blind}{0}
;  J::Send {Blind}{1}
;  K::Send {Blind}{2}
;  L::Send {Blind}{3}
;  U::Send {Blind}{4}
;  I::Send {Blind}{5}
;  O::Send {Blind}{6}
;  7::Send {Blind}{7}
;  8::Send {Blind}{8}
;  9::Send {Blind}{9}
;  `;::Send {Blind}{:}
;#If
; 上記の方法だと、修飾キーを認識できなかったので以下
NumLock & M::Send {Blind}{0}
NumLock & J::Send {Blind}{1}
NumLock & K::Send {Blind}{2}
NumLock & L::Send {Blind}{3}
NumLock & U::Send {Blind}{4}
NumLock & I::Send {Blind}{5}
NumLock & O::Send {Blind}{6}
NumLock & 7::Send {Blind}{7}
NumLock & 8::Send {Blind}{8}
NumLock & 9::Send {Blind}{9}
NumLock & `;::Send {Blind}{:}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Ja <-> En
;;;; LAlt単押しで英語日本語のトグル
;;;; F13単押しで日本語
;;;; LAlt単体長押しでLAlt

;;;; LAltのような修飾キーのupイベントは、修飾キー押下時にほかのキーが組み合わせて押されなかった場合にのみ発生するようになっているらしい
;;;; LAlt押下時にvk07やvkFFなどを必ず送ることで常にキーの組み合わせが発生 -> もともとのLAlt upイベントが発生しなくなる

LAlt up::
  IfInstring, A_PriorHotKey, LAlt, {
    Send {vkF0sc03A}
  }
  Return

;; WORSE
/*
*~LAlt::
  ;;Send +{Blind}{vkE8}  ;; 英数キー
  Send {b}
  KeyWait, LAlt, T0.5  ;; LAltが0.5秒間upしない -> ErrorLevel := 1
  If (ErrorLevel) {
    KeyWait, LAlt   ;; これがないと長押ししている間何度もLAltが送られる
    If (A_PriorKey == "LAlt") ;; LAlt単押しかどうかの判定
      send {LAlt}
  }
  Return
*/

;; BETTER
*~LAlt::
  Send +{Blind}{vkE8}  ;; 英数キー
  KeyWait, LAlt  ;; LAltのup待ち
  ;; このホットキー開始からの経過時間が400ms以上（ここで`LAlt up`が発生するので、ThisHotkey(=LAlt up)ではなくPriorHotKey(=*~LAlt)を対象）
  ;; かつ LAlt単押し
  If (A_TimeSincePriorHotkey >= 500 && A_PriorKey == "LAlt")
    send {LAlt}
  Return

F13::SendEvent {vkF2sc070}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; winClass, winTitle

;;;; Ctrl+Shift+wを長押しでActive Windowのclassとtitleを表示
;;;; debug用

/*
<^+w::
  WinGetClass, class, A
  WinGetTitle, title, A
  MsgBox
( 
 class: %class%
title: %title%
)
  Return
*/

$^+w::
  KeyWait, w, T1.0
  If (ErrorLevel) {
    KeyWait, w
    WinGetClass, class, A
    WinGetTitle, title, A
    MsgBox
(
 class: %class%
title: %title%
)
  } Else {
    send_self()
  }
  Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	

;; emacs
;;;; Alt+Shift+Ctrl+eでemacsモードを切り替え
;;;; terminal等ではemacsモードは自動無効化

emx_tggl() {
  global  ;; 仮定グローバルモード
  If (emx_tggl_var == "") {
    emx_tggl_var := 1
  }
  emx_tggl_var ^= 1
  If emx_tggl_var {
    MsgBox emacs mode on(%emx_inval_custom%)
  } Else {
    MsgBox emacs mode off(%emx_inval_custom%)
  }
  Return
}

/*
LControl up::
  Input, outVar, T1, {LControl}
  MsgBox %ErrorLevel%
  IfInString, ErrorLevel, EndKey:, {
    MsgBox toggle
    emx_tggl()
  }
  Return
*/
+<^e::emx_tggl()

var_w_default(var, default) {
  If (var = "")
    var := default
  Return var
}

emx_inval_custom() {
  global
  emx_inval_custom := var_w_default(emx_inval_custom, "fm")
  InputBox, emx_inval_custom, Invalidate Emacs Key Bindings, Enter keys to invalidate with comma`n(e.g. "bd"),,300,150,,,,,%emx_inval_custom%
  emx_inval_custom_arr := StrSplit(emx_inval_custom)
  tmp =
  for index, param in emx_inval_custom_arr
    tmp .= "," . param
  emx_inval_custom_str := SubStr(tmp, 2)
}
+<^i::emx_inval_custom()

is_emx_mode(chr) {
  global  ;; 仮定グローバルモード
  emx_inval_custom := var_w_default(emx_inval_custom, "fm")
  emx_inval_custom_str := var_w_default(emx_inval_custom_str, "f,m")
  If (emx_tggl_var == "" || emx_tggl_var)
  If    !WinActive("ahk_class ConsoleWindowClass")
     && !WinActive("ahk_class CASCADIA_HOSTING_WINDOW_CLASS")
     && !WinActive("ahk_class XLMAIN")
     && !WinActive("ahk_class PPTFrameClass")
  If chr not in %emx_inval_custom_str%
  {
    Return 1
  } Else {
    Return 0
  }
}

;;;; a::Send {a} とか a::Send %A_ThisHotkey% とかは、aを押しても自己参照してしまいaを出力しない
;;;; hotkeyを一度offにしてSendの後にonに戻すか、バーチャル入力$付きで入力を受けるようにして、Send時には$を外すようにする

send_self() {
  StringReplace, key, A_ThisHotkey, $, , All
  Send, %key%
  ;Hotkey, %A_ThisHotkey%, off
  ;Send, %A_ThisHotkey%
  ;Hotkey, %A_ThisHotkey%, on
}

$^b::
  If is_emx_mode("b") {
    Send {Left}
  } Else {
    send_self()
  }
  Return
$^f::
  If is_emx_mode("f") {
    Send {Right}
  } Else {
    send_self()
  }
  Return
$^a::
  If is_emx_mode("a") {
    Send {Home}
  } Else {
    send_self()
  }
  Return
$^e::
  If is_emx_mode("e") {
    Send {End}
  } Else {
    send_self()
  }
  Return
$^u::
  If is_emx_mode("u") {
    Send +{Home}
    Send {BS}
  } Else {
    send_self()
  }
  Return
$^k::
  If is_emx_mode("k") {
    Send +{End}
    Send {BS}
  } Else {
    send_self()
  }
  Return
$^h::
  If is_emx_mode("h") {
    Send {BS}
  } Else {
    send_self()
  }
  Return
$^d::
  If is_emx_mode("d") {
    Send {Del}
  } Else {
    send_self()
  }
  Return
$+^d::
  If is_emx_mode("d") {
    Send +{Del}
  } Else {
    send_self()
  }
  Return
$^m::
  If is_emx_mode("m") {
    Send {Enter}
  } Else {
    send_self()
  }
  Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; finish application
#q::WinClose, A

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; search application
#s::Return
^Space::Send, #{s}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Escape
;;;; <^[のあとに<^は押したまま[を再び押すとEscape

~<^[ up::
  If GetKeyState("LControl") {
    KeyWait, [, D, T1
    If (ErrorLevel = 0) {
      Send, {Escape}
    }
  }
  Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; tab switching
;; `+^Tab`と`^Tab`を別々に定義すると、`*`がないにもかかわらず`+^Tab`を押したときになぜかどちらも起動してしまうので、`+`が押されているかどうかで場合分けする
*^Tab::
  If WinActive("ahk_class CASCADIA_HOSTING_WINDOW_CLASS") {
    Send {blind}{Tab}
  } Else {
    If GetKeyState("LShift", "P") {
      Send ^{PgUp}
    } Else {
      Send ^{PgDn}
    }
  }
