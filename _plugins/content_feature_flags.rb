module ContentFeatureFlags
  MATH_BLOCK = /\$\$.*?\$\$/m.freeze
  MATH_ENV = /\\begin\{(?:equation|align|gather|multline|cases)\}/.freeze
  MATH_INLINE = /(^|[^\\])\$[^$\n]{1,120}\$/.freeze

  def self.needs_mathjax?(text)
    text.match?(MATH_BLOCK) || text.match?(MATH_ENV) || text.match?(MATH_INLINE)
  end

  def self.needs_mermaid?(text)
    text.include?('```mermaid') || text.include?('{% mermaid') || text.include?('language-mermaid')
  end
end

%i[posts pages].each do |kind|
  Jekyll::Hooks.register kind, :pre_render do |doc|
    content = doc.content.to_s

    explicit_mathjax = doc.data['mathjax']
    doc.data['needs_mathjax'] =
      explicit_mathjax.nil? ? ContentFeatureFlags.needs_mathjax?(content) : explicit_mathjax

    doc.data['needs_mermaid'] = ContentFeatureFlags.needs_mermaid?(content)
  end
end
