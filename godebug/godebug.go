// A stub for internal/godebug module from standard library.
// Since 'internal' modules are not importable, we have this substitute.

package godebug

type Setting struct {
	name string
}

func New(name string) *Setting {
	return &Setting{name: name}
}

func (s *Setting) Name() string {
	return s.name
}

func (s *Setting) Value() string {
	// all GODEBUG options are false by default unless overriden, so return false
	return "0"
}

func (s *Setting) String() string {
	return s.Name() + "=" + s.Value()
}

func (s *Setting) Undocumented() bool {
	return false
}

func (s *Setting) IncNonDefault() {
}
