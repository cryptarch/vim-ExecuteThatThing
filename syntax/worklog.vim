syntax      match   ShellCommand    +^\$ .*+
syntax      match   Comment         +^### .*+
syntax      region  MiscBlock       start=/^\~\~\~$/    end=/^\~\~\~$/
syntax      region  MiscBlock       start=/^```$/    end=/^```$/

highlight   link    ShellCommand    Function
highlight   link    Table           Statement
