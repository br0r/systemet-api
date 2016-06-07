module Paths_systemetapi (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/vagrant/.cabal/bin"
libdir     = "/home/vagrant/.cabal/lib/x86_64-linux-ghc-7.10.3/systemetapi-0.0.0-6szRb5Cicb85FI9gx3rmBx"
datadir    = "/home/vagrant/.cabal/share/x86_64-linux-ghc-7.10.3/systemetapi-0.0.0"
libexecdir = "/home/vagrant/.cabal/libexec"
sysconfdir = "/home/vagrant/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "systemetapi_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "systemetapi_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "systemetapi_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "systemetapi_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "systemetapi_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
