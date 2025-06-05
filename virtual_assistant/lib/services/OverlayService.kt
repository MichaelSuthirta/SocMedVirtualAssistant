class OverlayService : Service() {
    private lateinit var windowManager: WindowManager
    private lateinit var chatHead: View

    override fun onCreate() {
        super.onCreate()
        chatHead = LayoutInflater.from(this).inflate(R.layout.chat_head, null)

        val params = WindowManager.LayoutParams(
            WindowManager.LayoutParams.WRAP_CONTENT,
            WindowManager.LayoutParams.WRAP_CONTENT,
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O)
                WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
            else
                WindowManager.LayoutParams.TYPE_PHONE,
            WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE,
            PixelFormat.TRANSLUCENT
        )

        windowManager = getSystemService(WINDOW_SERVICE) as WindowManager
        windowManager.addView(chatHead, params)
    }

    override fun onDestroy() {
        super.onDestroy()
        if (::chatHead.isInitialized) windowManager.removeView(chatHead)
    }

    override fun onBind(intent: Intent?): IBinder? = null
}
