module gio.ErrorGIO;

private import gio.c.functions;
public  import gio.c.types;


/** */
public struct ErrorGIO
{

	/**
	 * Converts errno.h error codes into GIO error codes. The fallback
	 * value %G_IO_ERROR_FAILED is returned for error codes not currently
	 * handled (but note that future GLib releases may return a more
	 * specific value instead).
	 *
	 * As %errno is global and may be modified by intermediate function
	 * calls, you should save its value as soon as the call which sets it
	 *
	 * Params:
	 *     errNo = Error number as defined in errno.h.
	 *
	 * Returns: #GIOErrorEnum value for the given errno.h error number.
	 */
	public static GIOErrorEnum ioErrorFromErrno(int errNo)
	{
		return g_io_error_from_errno(errNo);
	}

	/**
	 * Gets the GIO Error Quark.
	 *
	 * Returns: a #GQuark.
	 */
	public static GQuark ioErrorQuark()
	{
		return g_io_error_quark();
	}
}
