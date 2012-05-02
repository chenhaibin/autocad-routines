(defun c:annotatelotno (/ oe tmp NVS)
    (setq oe (getvar "cmdecho")
          ol (getvar "clayer")
    )
    (setvar "clayer" lol)
    (setvar "cmdecho" 0)
    (if (not NV)
        (setq NV 1)
    )
    (if (not NI)
        (setq NI 1)
    )
    (setq tmp (getint (strcat "\nEnter starting number <" (itoa NV) ">: ")))
    (if tmp
        (setq NV tmp)
    )
    (setq tmp (getint (strcat "\nNumber to increment by <" (itoa NI) ">: ")))
    (if tmp
        (setq NI tmp)
    )
    (while
        (setq PT (getpoint (strcat "\nSelect insertion point for lot " (itoa NV) ": ")))
           (setq NVS (itoa NV)
                 NV  (+ NV NI)
           )
           (command "._text" "s" lotstyle "mc" PT lots)
           (command "" NVS)
    )
    (setvar "cmdecho" oe)
    (setvar "clayer" ol)
    (princ)
)