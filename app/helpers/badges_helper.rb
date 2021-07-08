module BadgesHelper
  def translate_types_from_symbol
    Badge::TYPES.map do |s|
      [t("admin.badges.types.#{s}"), s]
    end
  end
end
