module I18n
  module Backend
    class Simple
      module Implementation
        alias_method :lookup_orig, :lookup

        # Give ability to check I18n looked up keys in lazy mode by setting env var I18N_DEBUG to true
        # 
        def lookup(locale, key, scope = [], options = {})
          puts "I18N keys: #{I18n.normalize_keys(locale, key, scope, options[:separator])}"
          lookup_orig(locale, key, scope, options)
        end
      end
    end
  end
end