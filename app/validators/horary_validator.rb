class HoraryValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    initial_horary = DateTime.now.change({ hour: 9, min: 0, sec: 0 })
    final_horary = DateTime.now.change({ hour: 18, min: 0, sec: 0 })
    unless DateTime.now.between?(initial_horary, final_horary)
      record.errors[attribute] << (options[:message] || "Horário não permitido para entrada/saida de materiais")
    end
  end
end
