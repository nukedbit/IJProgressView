Pod::Spec.new do |spec|
  spec.name = 'IJProgressView'
  spec.version = '1.2.1'
  spec.summary = 'A simple progress view written in Swift.'
  spec.homepage = 'https://github.com/Isuru-Nanayakkara/IJProgressView'
  spec.license = 'MIT'
  spec.author = { 'Isuru Nanayakkara' => 'isuru.nan@gmail.com', "Sebastian Faltoni" => "1690316+nukedbit@users.noreply.github.com" }
  spec.source = { :git => 'https://github.com/Isuru-Nanayakkara/IJProgressView.git', :tag => "#{spec.version}" }
  spec.source_files = 'IJProgressView/IJProgressView/IJProgressView.swift'
  spec.requires_arc = true
end
