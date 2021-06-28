module gio.PollableInputStreamT;

public  import gio.Cancellable;
public  import gio.c.functions;
public  import gio.c.types;
public  import glib.ErrorG;
public  import glib.GException;
public  import glib.Source;


/**
 * #GPollableInputStream is implemented by #GInputStreams that
 * can be polled for readiness to read. This can be used when
 * interfacing with a non-GIO API that expects
 * UNIX-file-descriptor-style asynchronous I/O rather than GIO-style.
 *
 * Since: 2.28
 */
public template PollableInputStreamT(TStruct)
{
	/** Get the main Gtk struct */
	public GPollableInputStream* getPollableInputStreamStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(GPollableInputStream*)getStruct();
	}


	/**
	 * Checks if @stream is actually pollable. Some classes may implement
	 * #GPollableInputStream but have only certain instances of that class
	 * be pollable. If this method returns %FALSE, then the behavior of
	 * other #GPollableInputStream methods is undefined.
	 *
	 * For any given stream, the value returned by this method is constant;
	 * a stream cannot switch from pollable to non-pollable or vice versa.
	 *
	 * Returns: %TRUE if @stream is pollable, %FALSE if not.
	 *
	 * Since: 2.28
	 */
	public bool canPoll()
	{
		return g_pollable_input_stream_can_poll(getPollableInputStreamStruct()) != 0;
	}

	/**
	 * Creates a #GSource that triggers when @stream can be read, or
	 * @cancellable is triggered or an error occurs. The callback on the
	 * source is of the #GPollableSourceFunc type.
	 *
	 * As with g_pollable_input_stream_is_readable(), it is possible that
	 * the stream may not actually be readable even after the source
	 * triggers, so you should use g_pollable_input_stream_read_nonblocking()
	 * rather than g_input_stream_read() from the callback.
	 *
	 * Params:
	 *     cancellable = a #GCancellable, or %NULL
	 *
	 * Returns: a new #GSource
	 *
	 * Since: 2.28
	 */
	public Source createSource(Cancellable cancellable)
	{
		auto __p = g_pollable_input_stream_create_source(getPollableInputStreamStruct(), (cancellable is null) ? null : cancellable.getCancellableStruct());

		if(__p is null)
		{
			return null;
		}

		return new Source(cast(GSource*) __p, true);
	}

	/**
	 * Checks if @stream can be read.
	 *
	 * Note that some stream types may not be able to implement this 100%
	 * reliably, and it is possible that a call to g_input_stream_read()
	 * after this returns %TRUE would still block. To guarantee
	 * non-blocking behavior, you should always use
	 * g_pollable_input_stream_read_nonblocking(), which will return a
	 * %G_IO_ERROR_WOULD_BLOCK error rather than blocking.
	 *
	 * Returns: %TRUE if @stream is readable, %FALSE if not. If an error
	 *     has occurred on @stream, this will result in
	 *     g_pollable_input_stream_is_readable() returning %TRUE, and the
	 *     next attempt to read will return the error.
	 *
	 * Since: 2.28
	 */
	public bool isReadable()
	{
		return g_pollable_input_stream_is_readable(getPollableInputStreamStruct()) != 0;
	}

	/**
	 * Attempts to read up to @count bytes from @stream into @buffer, as
	 * with g_input_stream_read(). If @stream is not currently readable,
	 * this will immediately return %G_IO_ERROR_WOULD_BLOCK, and you can
	 * use g_pollable_input_stream_create_source() to create a #GSource
	 * that will be triggered when @stream is readable.
	 *
	 * Note that since this method never blocks, you cannot actually
	 * use @cancellable to cancel it. However, it will return an error
	 * if @cancellable has already been cancelled when you call, which
	 * may happen if you call this method after a source triggers due
	 * to having been cancelled.
	 *
	 * Params:
	 *     buffer = a buffer to
	 *         read data into (which should be at least @count bytes long).
	 *     cancellable = a #GCancellable, or %NULL
	 *
	 * Returns: the number of bytes read, or -1 on error (including
	 *     %G_IO_ERROR_WOULD_BLOCK).
	 *
	 * Throws: GException on failure.
	 */
	public ptrdiff_t readNonblocking(ubyte[] buffer, Cancellable cancellable)
	{
		GError* err = null;

		auto __p = g_pollable_input_stream_read_nonblocking(getPollableInputStreamStruct(), buffer.ptr, cast(size_t)buffer.length, (cancellable is null) ? null : cancellable.getCancellableStruct(), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return __p;
	}
}