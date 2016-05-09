class HoraryDayValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    initial_horary = DateTime.now.change({ hour: 9, min: 0, sec: 0 })
    final_horary = DateTime.now.change({ hour: 18, min: 0, sec: 0 })
    now = DateTime.now
    unless now.between?(initial_horary, final_horary)
      record.errors[:horario] << "não permitido para retiradas. (Horário permitido: #{initial_horary.hour}h até #{final_horary.hour}h)"
    end
    if now.saturday? || now.sunday?
      record.errors[:retiradas] << "só podem ser realizadas em dias de semana."
    end
  end
end
