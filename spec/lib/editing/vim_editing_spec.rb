describe 'Vim Editing' do

  describe Editing::Vim::Put do
    before { @builder = Editing::Vim::Put.new }
    it_behaves_like 'a keystroke'
    it 'puts content of buffer' do
      expect(@builder.action).to eq 'p'
    end
  end

  describe Editing::Vim::YankWithinWord do
    before { @builder = Editing::Vim::YankWithinWord.new }
    it_behaves_like 'a text macro'
    it 'yanks within a word' do
      expect(@builder.action).to eq 'yiw'
    end
  end

  describe Editing::Vim::YankAroundRubyClass do
    before { @builder = Editing::Vim::YankAroundRubyClass.new }
    it_behaves_like 'a text macro'
    it 'submits yaM to yank around a ruby class' do
      expect(@builder.action).to eq 'yaM'
    end
  end

  describe Editing::Vim::YankAroundRubyBlock do
    before { @builder = Editing::Vim::YankAroundRubyBlock.new }
    it_behaves_like 'a text macro'
    it 'submits yar to yank around a ruby block' do
      expect(@builder.action).to eq 'yar'
    end
  end

  describe Editing::Vim::YankWithinRubyBlock do
    before { @builder = Editing::Vim::YankWithinRubyBlock.new }
    it_behaves_like 'a text macro'
    it 'submits yar to yank around a ruby block' do
      expect(@builder.action).to eq 'yir'
    end
  end

  describe Editing::Vim::YankUp do
    before { @builder = Editing::Vim::YankUp.new }
    it_behaves_like 'an applescript'
    it 'puts spoken integer between y and k' do
      expect(@builder.action.align_left).to include <<-APPLESCRIPT.align_left
        set _dictateApp to (name of current application)
        on srhandler(vars)
          set spokenArguments to (varSpokenArguments of vars)
          keystroke "y" & spokenInteger(spokenArguments) & "k"
        end srhandler
      APPLESCRIPT
    end
    it_behaves_like 'it includes spokenInteger'
  end

  describe Editing::Vim::YankDown do
    before { @builder = Editing::Vim::YankDown.new }
    it_behaves_like 'an applescript'
    it 'puts spoken integer between y and j' do
      expect(@builder.action.align_left).to include <<-APPLESCRIPT.align_left
        set _dictateApp to (name of current application)
        on srhandler(vars)
          set spokenArguments to (varSpokenArguments of vars)
          keystroke "y" & spokenInteger(spokenArguments) & "j"
        end srhandler
      APPLESCRIPT
    end
    it_behaves_like 'it includes spokenInteger'
  end
end
