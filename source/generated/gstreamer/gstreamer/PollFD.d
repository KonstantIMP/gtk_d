module gstreamer.PollFD;

private import gstreamer.c.functions;
public  import gstreamer.c.types;


/**
 * A file descriptor object.
 */
public class PollFD
{
	/** the main Gtk struct */
	protected GstPollFD* gstPollFD;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstPollFD* getPollFDStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstPollFD;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstPollFD;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstPollFD* gstPollFD, bool ownedRef = false)
	{
		this.gstPollFD = gstPollFD;
		this.ownedRef = ownedRef;
	}


	/**
	 * Initializes @fd. Alternatively you can initialize it with
	 * #GST_POLL_FD_INIT.
	 */
	public void init()
	{
		gst_poll_fd_init(gstPollFD);
	}
}
