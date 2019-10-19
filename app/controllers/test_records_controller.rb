class TestRecordsController < ApplicationController
  def index
    @test_records = TestRecord.where(user_id: current_user.id)
  end

  def create
    @test = Test.find_by id: test_record_params[:test_id]
    if @test
      @test_record = TestRecord.new(test_id: @test.id,
                                    user_id: current_user.id)
      if @test_record.save
        render status: :created
      end
    end
  end

  def show
    @test_record = TestRecord.find_by(id: params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def test_record_params
    params.require(:test_record).permit(:test_id)
  end
end
