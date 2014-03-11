class GraphsController < ApplicationController

  def index

    @active_question = Question.active.first

    @answer_count = Inquiry.get_values(@active_question)

    @total_votes    = @answer_count[:total]
    @total_valid    = @answer_count[:v_answers]
    @enthaltungen   = @answer_count[:e_answers]
    @einfaches_mehr = (@total_valid.to_f / 2 + 1).floor
    @absolutes_mehr = (@total_votes.to_f / 2 + 1).floor

    # Question.set_false  # alle Records auf 'false' setzen und damit Votes mehr zulassen.

    @chart2 = LazyHighCharts::HighChart.new('column') do |f|
      f.title({:text=>"#{@active_question.poke}" })

      f.series( name: 'Votes',
                data: [ @answer_count[:t_answers],  @answer_count[:f_answers] ]
              )
      f.series( name: 'Votes',
                data: [ 0,                          @answer_count[:e_answers] ]
              )

      ### Options for Bar
      f.options[:chart][:defaultSeriesType] = "column"
      #f.options[:xAxis][:categories] = ['Yes', 'No']
      #f.options[:yAxis][:allowDecimals] = false
      f.xAxis (
        { 
          categories:  ['Yes', 'No/Abstentions'],
          labels: {
              style: {
                color: '',
                fontWeight: 'bold',
                fontSize: '14px'
            }
          }
        }
      )

      f.yAxis({
            allowDecimals: 'false', 
            stackLabels: { enabled: 'true' , 
                              style: {
                                        fontWeight: 'bold',
                                        #color: 'green'
                                    }
                        }
      })
      
      f.options[:yAxis][:allowDecimals] = false


      #f.labels(:items=>[:html=>"Total fruit consumption", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ]) 



      f.plot_options(
        { column: 
          { stacking: "normal"}
        }
       )


      #@chart2 = LazyHighCharts::HighChart.new('column') do |f|
      #  f.series(:name=>'John',:data=> [3, 20, 3, 5, 4, 10, 12 ])
      #  f.series(:name=>'Jane',:data=> [1, 3, 4, 3, 3, 5, 4, -4 ] ) 
      #  f.title({:text=>"example test title from controller"})

      ### Options for Bar
      #  f.options[:chart][:defaultSeriesType] = "bar"
      #  f.plot_options({:series=>{:stacking=>"normal"}})

      ## or options for column
      #f.options[:chart][:defaultSeriesType] = "column"
      #f.plot_options({:column=>{:stacking=>"percent"}})
    end #chart2 do

    @remarks = @answer_count[:remarks]
  end #def index
end