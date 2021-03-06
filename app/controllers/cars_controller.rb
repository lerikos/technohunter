# Контроллер для работы объявлениями легкового транспорта
class CarsController < VehiclesController
  # Расширяем функционал специально для типа легкового транспорта
  def index
    @cars = Car.where(moderate: true).order('created_at DESC')
  end

  # Создание нового объекта легкового транспорта
  # Переопределен от родительского класса
  def new_vehicle(params)
    @car = Car.new(params)
  end

  private

  # Strong Params. Перечисляем необходимые для создания параметры
  def vehicle_params
    params.require(:car).permit(
      :vehicle_type, :body, :description, :engine, :engine_cap, :kpp,
      :vehicle_status, :price, :drive, :mileage, :vin_code, :year, :status,
      :region_id, :city_id, :brand_id, :model_id
    )
  end
end
