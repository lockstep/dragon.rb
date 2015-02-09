describe 'Vim Navigation' do

  describe Navigation::Vim::ToggleFile do
    before { @builder = Navigation::Vim::ToggleFile.new }
    it_behaves_like 'a text macro'
    it 'is two spaces followed by a return' do
      expect(@builder.action).to eq '  '
    end
  end

  describe Navigation::Vim::RightWindow do
    before { @builder = Navigation::Vim::RightWindow.new }
    it_behaves_like 'a keystroke'
    it 'hits control l to navigate a window to the right' do
      expect(@builder.action).to eq 'Control-l'
    end
  end

  describe Navigation::Vim::LeftWindow do
    before { @builder = Navigation::Vim::LeftWindow.new }
    it_behaves_like 'a keystroke'
    it 'hits control l to navigate a window to the right' do
      expect(@builder.action).to eq 'Control-h'
    end
  end

  describe Navigation::Vim::UpWindow do
    before { @builder = Navigation::Vim::UpWindow.new }
    it_behaves_like 'a keystroke'
    it 'hits control k to navigate a window upwards' do
      expect(@builder.action).to eq 'Control-k'
    end
  end

  describe Navigation::Vim::DownWindow do
    before { @builder = Navigation::Vim::DownWindow.new }
    it_behaves_like 'a keystroke'
    it 'hits control j to navigate a window downwards' do
      expect(@builder.action).to eq 'Control-j'
    end
  end

  describe Navigation::Vim::FileTop do
    before { @builder = Navigation::Vim::FileTop.new }
    it_behaves_like 'a text macro'
    it 'hits gg to navigate to the files top' do
      expect(@builder.action).to eq 'gg'
    end
  end
end
