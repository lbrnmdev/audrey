module Sanitizable
  extend ActiveSupport::Concern

  private

    def downcase_attributes
      self.attributes.each {|attribute, value| self[attribute] = value.downcase if value.respond_to? 'downcase'}
    end

    def nil_if_blank
      self.attributes.each do |key, value|
        self[key] = nil if (value.respond_to?("blank?") && value.blank?)
      end
    end

    # remove leading, trailing and excess whitespace
    def squish_inputs
      self.attributes.each do |key, value|
        self[key] = value.squish if value.respond_to?("squish")
      end
    end
end
