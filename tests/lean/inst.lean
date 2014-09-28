import logic data.prod priority
open priority
set_option pp.notation false

inductive C (A : Type) :=
mk : A → C A

definition val {A : Type} (c : C A) : A :=
C.rec (λa, a) c

variable magic (A : Type) : A
definition C_magic [instance] [priority max] (A : Type) : C A :=
C.mk (magic A)

definition C_prop [instance] : C Prop :=
C.mk true

definition C_prod [instance] {A B : Type} (Ha : C A) (Hb : C B) : C (prod A B) :=
C.mk (pair (val Ha) (val Hb))

-- C_magic will be used because it has max priority
definition test : C (prod Prop Prop) := _

eval test
