module gio.FileDescriptorBasedT;

public  import gio.c.functions;
public  import gio.c.types;


/**
 * #GFileDescriptorBased is implemented by streams (implementations of
 * #GInputStream or #GOutputStream) that are based on file descriptors.
 * 
 * Note that `<gio/gfiledescriptorbased.h>` belongs to the UNIX-specific
 * GIO interfaces, thus you have to use the `gio-unix-2.0.pc` pkg-config
 * file when using it.
 *
 * Since: 2.24
 */
public template FileDescriptorBasedT(TStruct)
{
	/** Get the main Gtk struct */
	public GFileDescriptorBased* getFileDescriptorBasedStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(GFileDescriptorBased*)getStruct();
	}


	/**
	 * Gets the underlying file descriptor.
	 *
	 * Returns: The file descriptor
	 *
	 * Since: 2.24
	 */
	public int getFd()
	{
		return g_file_descriptor_based_get_fd(getFileDescriptorBasedStruct());
	}
}
